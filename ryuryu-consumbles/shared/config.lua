Config = {}

Config = {
    ["watter_bottle1"] = {
        RemoveItem = "watter_bottle1",
        RemoveItemCount = 1,
        afteruse = {
            notifytitle = "水を飲んだ",
            Add = false,
            AddItem = "", -- Remove Item name
            AddItemCount = 1, -- Remove Item Count
            Effect = {
                hunger = 0,
                thirst = 45,
                Relievestress = 0,  
                Gainstress = 0,
                armor = 0,
                hp = 0,
            },
            addoneffect = function() -----cliant
                -- body

            end
        },
        options = {
            duration = 6400,
            label = '飲んでいます',
            useWhileDead = false,
            canCancel = true,
            allowFalling = false,
            disable = {
                move = false,
                car = true,
                combat = true,
                sprint = true,
            },
            anim = {
                dict = 'amb@world_human_drinking@coffee@male@idle_a',
                clip = 'idle_c'
            },
            prop = {
                model = 'p_amb_coffeecup_01',
                bone = 57005,
                pos = vec3(0.15, 0.02, -0.03),
                rot = vec3(-70.0, 30.0, 10.0)
            },
        }
    },
    ["watter_bottle1"] = {
        RemoveItem = "snack1",
        RemoveItemCount = 1,
        afteruse = {
            notifytitle = "お菓子を食べた",
            Add = false,
            AddItem = "", -- Remove Item name
            AddItemCount = 1, -- Remove Item Count
            Effect = {
                hunger = 0,
                thirst = 45,
                Relievestress = 0,
                Gainstress = 0,
                armor = 0,
                hp = 0,
            },
            addoneffect = function() -----cliant
                -- body

            end
        },
        options = {
            duration = 6400,
            label = '食べています',
            useWhileDead = false,
            canCancel = true,
            allowFalling = false,
            disable = {
                move = false,
                car = true,
                combat = true,
                sprint = true,
            },
            anim = {
                dict = 'mp_player_inteat@burger',
                clip = 'mp_player_int_eat_burger'
            },
            prop = {
                model = 'prop_cs_burger_01',
                bone = 18905,
                pos = vec3(0.13, 0.06, 0.02),
                rot = vec3(-130.0, -7.0, 0.0)
            },
        }
    },


} 