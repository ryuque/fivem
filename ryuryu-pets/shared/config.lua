Config = {}

Config = {
    petBuyCoords = vector3(-1368.35, 56.31, 53.7),
    petShowCoords = vector4(-1366.09,56.35,54.1,119.19),
    AvailablePets = {
        ["JOB"] = {
            [1] = {
                job = "police",
                petName = "警察犬 チョップ",
                petLabel = "かわいいチョップ.",
                petIMG = "",
                pedHash = "a_c_chop",
                petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
                listOf = "dog", -- which list to be on
            },
        },
        ["DOG"] = {
            [1] = {
                petName = "マルチーズ",
                petLabel = "かわいいマルチーズ.",
                petIMG = "",
                pedHash = "a_c_westy",
                petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
                listOf = "dog", -- which list to be on
            }, 
            [2] = {
                petName = "レトリバー",
                petLabel = "かわいいレトリバー.",
                petIMG = "",
                pedHash = "a_c_retriever",
                petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
                listOf = "dog", -- which list to be on
            }, 
            [3] = {
                petName = "パグ",
                petLabel = "かわいいパグ.",
                petIMG = "",
                pedHash = "a_c_pug",
                petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
                listOf = "dog", -- which list to be on
            },
            [4] = {
                petName = "ハスキー",
                petLabel = "かわいいハスキー.",
                petIMG = "",
                pedHash = "a_c_husky",
                petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
                listOf = "dog", -- which list to be on
            },
            [5] = {
                petName = "シェパード",
                petLabel = "かわいいシェパード.",
                petIMG = "",
                pedHash = "a_c_shepherd",
                petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
                listOf = "dog", -- which list to be on
            },
            [6] = {
                petName = "ロットワイラー",
                petLabel = "かわいいロットワイラー.",
                petIMG = "",
                pedHash = "a_c_rottweiler",
                petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
                listOf = "dog", -- which list to be on
            },
        },
        ["CAT"] = {
            [1] = {
                petName = "ねこ",
                petLabel = "かわいい猫.",
                petIMG = "",
                pedHash = "a_c_cat_01",
                petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
                listOf = "cat", -- which list to be on
            },
            [2] = {
                petName = "ねこ",
                petLabel = "かわいい猫.",
                petIMG = "",
                pedHash = "a_c_cat_01",
                petTexureID = 1, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
                listOf = "cat", -- which list to be on
            },
            [3] = {
                petName = "ねこ",
                petLabel = "かわいい猫.",
                petIMG = "",
                pedHash = "a_c_cat_01",
                petTexureID = 2, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
                listOf = "cat", -- which list to be on
            },
        },
    },
    Petinfo ={
        ["a_c_chop"] = {
            petkind = "dog",
        },
        ["a_c_westy"] = {
            petkind = "dog",
        },
        ["a_c_retriever"] = {
            petkind = "dog",
        },
        ["a_c_pug"] = {
            petkind = "dog",
        },
        ["a_c_husky"] = {
            petkind = "dog",
        },
        ["a_c_shepherd"] = {
            petkind = "dog",
        },
        ["a_c_rottweiler"] = {
            petkind = "dog",
        },
        ["a_c_cat_01"] = {
            petkind = "cat",
        },
    },

    RandomAnim = {
        ["dog"] = {
            [1] = {
                animName = "creatures@rottweiler@amb@world_dog_sitting@idle_a",
                animID = "idle_b" 
            },
            [2] = {
                animName = "creatures@rottweiler@amb@world_dog_barking@idle_a",
                animID = "idle_a" 
            },
            [3] = {
                animName = "creatures@rottweiler@amb@sleep_in_kennel@",
                animID = "sleep_in_kennel" 
            }, 
            
        },
        ["cat"] = {
            [1] = {
                animName = "creatures@cat@amb@world_cat_sleeping_ground@base",
                animID = "base" 
            }, 
            [2] = {
                animName = "creatures@cat@amb@world_cat_sleeping_ledge@base",
                animID = "base" 
            },             
        },
    }

} 