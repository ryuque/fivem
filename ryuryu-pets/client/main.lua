local QBCore = exports["qb-core"]:GetCoreObject()
local cam = nil
local PetShopPed = nil
local BuyPetModel = nil
local BuyPetTexure = 0

function setCamera(bool, PedId)
    if bool then
        if PedId ~= nil then
            cam = CreateCam('DEFAULT_SCRIPTED_CAMERA')
            -- Pedの位置と向きを取得
            local pedCoords = GetEntityCoords(PedId)
            local pedHeading = GetEntityHeading(PedId)
            
            -- Pedの正面にカメラを配置するためのオフセットを計算
            local offsetX = 0.5 * math.sin(math.rad(pedHeading)) -- 正面方向のx軸オフセット
            local offsetY = 0.5 * math.cos(math.rad(pedHeading)) -- 正面方向のy軸オフセット
            
            -- カメラの位置をPedの正面に設定
            local camPosX = pedCoords.x + offsetX
            local camPosY = pedCoords.y - offsetY
            local camPosZ = pedCoords.z + 0.5 -- 適切な高さを調整する必要があります
            
            -- カメラの位置を設定
            SetCamCoord(cam, camPosX, camPosY, camPosZ)
            
            -- カメラの向きを設定
            PointCamAtEntity(cam, PedId)
            
            -- カメラをアクティブにし、レンダリングを開始
            SetCamActive(cam, true)
            RenderScriptCams(true, true, 800, true, true)
        end
    else
        if cam ~= nil then
            -- カメラを非アクティブにし、レンダリングを停止
            ClearFocus()
            RenderScriptCams(false, false, 0, true, false)
            
            -- カメラを破棄
            DestroyCam(cam, false)
            cam = nil
        end
    end
end

function ChangePedFacingDirection(ped, head)
    -- 現在の向きを取得
    local currentHeading = GetEntityHeading(ped)
    local newHeading = currentHeading
    -- 新しい向きを計算（ここでは90度回転させる例）
    if head == "left" then
        newHeading = (currentHeading + 90.0)/360
    elseif head == "right" then
        newHeading = (currentHeading - 90.0)/360
    end
    -- 新しい向きを適用
    SetEntityHeading(ped, newHeading)
end

function ClosePetShop()
    setCamera(false)
    if PetShopPed ~= nil then
        DeleteEntity(PetShopPed)
        DeletePed(PetShopPed)
        PetShopPed = nil
        BuyPetModel = nil
    end
end
function SelectPet(ped, petTexureID)
    if PetShopPed ~= nil then
        DeleteEntity(PetShopPed)
        DeletePed(PetShopPed)
        PetShopPed = nil
    end
    BuyPetModel = ped
    BuyPetTexure = petTexureID
    local pedHash = GetHashKey(ped)
    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
        Wait(100)
    end
    PetShopPed = CreatePed(petTexureID, pedHash, Config.petShowCoords.x, Config.petShowCoords.y, Config.petShowCoords.z-1.0, Config.petShowCoords.h, false, true)

    FreezeEntityPosition(PetShopPed, true)
    SetPedComponentVariation(PetShopPed, 3 , 0, 0, 2) -- 3(torso)   |  Tasma değiştiriyor 1.tasma,2.türü,3.renk
    SetPedComponentVariation(PetShopPed, 1 , 0, 0, 2) -- 3(torso)   |  gözlük değiştiriyor
    SetPedComponentVariation(PetShopPed, 8 , 0, 0, 2) -- 3(torso)   |  sapka
    SetPedComponentVariation(PetShopPed, 2 , 0, 0, 2) -- 3(torso)   |  bos
    SetPedComponentVariation(PetShopPed, 4 , 0, 0, 2) -- 3(torso)   |  bos
    SetPedComponentVariation(PetShopPed, 5 , 0, 0, 2) -- 3(torso)   |  bos
    SetPedComponentVariation(PetShopPed, 6 , 0, 0, 2) -- 3(torso)   |  bos
    SetPedComponentVariation(PetShopPed, 7 , 0, 0, 2) -- 3(torso)   |  bos
    SetPedComponentVariation(PetShopPed, 9 , 0, 0, 2) -- 3(torso)   |  bos
    SetPedComponentVariation(PetShopPed, 10 ,0, 0, 2) -- 3(torso)   |  bos
    SetPedComponentVariation(PetShopPed, 11 ,0, 0, 2) -- 3(torso)   |  bos
    SetPedComponentVariation(PetShopPed, 12 ,0, 0, 2) -- 3(torso)   |  bos 

    setCamera(true, PetShopPed)
end


lib.registerContext({
    id = 'open_petshop_faceinfo',
    title = 'ペットショップ',
    onExit = function()
        ClosePetShop()
    end,
    options = {
      {
        title = 'ジョブのペット',
        description = 'ジョブ限定のペット!',
        menu = 'job_pet_menu',
        icon = 'fas fa-user-circle',
        iconColor = 'green',
      },
      {
        title = '犬 ペット',
        description = '犬のペット!',
        menu = 'dog_pet_menu',
        icon = 'fas fa-dog',
        iconColor = 'blue',
      },
      {
        title = '猫 ペット',
        description = '猫のペット!',
        menu = 'cat_pet_menu',
        icon = 'fas fa-cat',
        iconColor = 'pink',
      },
      {
        title = '閉じる',
        onSelect = function()
            lib.hideContext(false)
            ClosePetShop()
        end
      },
    }
})

local tepselectback = {}
tepselectback = {
    title = "ペットを購入",
    onSelect = function()
        BuyPet()
    end
}
local job_pet = {}
for _,v in pairs(Config.AvailablePets["JOB"]) do
    local tep = {
        title = v.petName,
        description = v.petLabel,
        image = v.image,
        menu = 'job_pet_menu',
        onSelect = function()
            SelectPet(v.pedHash, v.petTexureID)
        end
    }
    table.insert(job_pet, tep)
end
table.insert(job_pet, tepselectback)

local dog_pet = {}
for _,v in pairs(Config.AvailablePets["DOG"]) do
    local tep = {
        title = v.petName,
        description = v.petLabel,
        image = v.image,
        menu = 'dog_pet_menu',
        onSelect = function()
            SelectPet(v.pedHash, v.petTexureID)
        end
    }
    table.insert(dog_pet, tep)
end
table.insert(dog_pet, tepselectback)

local cat_pet = {}
for _,v in pairs(Config.AvailablePets["CAT"]) do
    local tep = {
        title = v.petName,
        description = v.petLabel,
        image = v.image,
        menu = 'cat_pet_menu',
        onSelect = function()
            SelectPet(v.pedHash, v.petTexureID)
        end
    }
    table.insert(cat_pet, tep)
end
table.insert(cat_pet, tepselectback)

lib.registerContext({
    id = 'job_pet_menu',
    title = 'ペットショップ:ジョブのペット',
    menu = 'open_petshop_faceinfo',
    options = job_pet,
})
lib.registerContext({
    id = 'dog_pet_menu',
    title = 'ペットショップ:犬のペット',
    menu = 'open_petshop_faceinfo',
    options = dog_pet,
})
lib.registerContext({
    id = 'cat_pet_menu',
    title = 'ペットショップ:猫のペット',
    menu = 'open_petshop_faceinfo',
    options = cat_pet,
})

function OpenPetShopMenu()
    lib.showContext('open_petshop_faceinfo')
end