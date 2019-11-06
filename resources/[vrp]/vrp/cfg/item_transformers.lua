local cfg = {}

-- define static item transformers
-- see https://github.com/ImagicTheCat/vRP to understand the item transformer concept/definition

cfg.item_transformers = {
    ---------------------------------------STYRKETRÆNING / FITNESS---------------------------------------
    {
        name="Styrketræning", -- menu name
        r=255,g=125,b=0, -- color
        max_units=500,
        units_per_minute=100,
        x=-1202.96252441406,y=-1566.14086914063,z=4.61040639877319,
        radius=7.5, height=1.5, -- area
        recipes = {
            ["Træn styrke"] = { -- action name
                description="Øger din styrke. Maks styrke du kan løfte er 100 KG", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={}, -- items taken per unit
                products={}, -- items given per unit
                aptitudes={ -- optional
                    ["physical.strength"] = 1.5 -- "group.aptitude", give 1 exp per unit
                }
            }
        }
    },
    ---------------------------------------HAMPBLADE HØSTNING---------------------------------------
    {
        name="Høst Hampblade", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=300000,
        units_per_minute=50,
        x= 1057.6809082032,y=-3196.7355957032,z=-39.161262512208,
        radius=5, height=1.5, -- area
        recipes = {
            ["Høst Hampblade"] = { -- action name
                description="Høster hampblade, kan bruge til at lave skunk!", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                }, -- items taken per unit
                products={
                    ["hampblade"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },

    ---------------------------------------SKUNK TØRRING---------------------------------------
    {
        name="Skunk tørring", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=500000,
        units_per_minute=500,
        x=-579.63873291016,y=-1601.9987792969,z=27.010812759399,
        radius=5, height=1.5, -- area
        recipes = {
            ["Tørre Skunk"] = { -- action name
                description="Tørring af skunk, sælg det videre!", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["hampblade"] = 1
                }, -- items taken per unit
                products={
                    ["skunk"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },

    ---------------------------------------SALG AF SKUNK---------------------------------------
    {
        name="Salg af Skunk", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=500000,
        units_per_minute=500,
        x=140.55741882324,y=-1920.6635742188,z=21.006200790405,
        radius=2, height=1.5, -- area
        recipes = {
            ["Sælg Skunk"] = { -- action name
                description="Sælger Skunk til kriminelle", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["skunk"] = 1
                }, -- items taken per unit
                products={
                    ["dirty_money"] = 650
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },

    ---------------------------------------KOKAIN MARK---------------------------------------
    {
        name="Kokain mark", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=300000,
        units_per_minute=20,
        x=329.59255981445,y=6463.9516601563,z=30.393634796143,
        radius=2, height=1.5, -- area
        recipes = {
            ["Høst Kokain"] = { -- action name
                description="Høster Kokain, kan bruges til at lave kokain", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                }, -- items taken per unit
                products={
                    ["kokainblade"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },

    ---------------------------------------KOKAIN FREMSTILLING---------------------------------------
    {
        name="Kokain fremstilling", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=100000,
        units_per_minute=500,
        x=1952.7640380859,y=5181.0151367188,z=47.963081359863,
        radius=5, height=1.5, -- area
        recipes = {
            ["Lav Kokain"] = { -- action name
                description="Fremstiller kokain, til salg!", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["kokainblade"]=2
                }, -- items taken per unit
                products={
                    ["kokain"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },


    ---------------------------------------KOKAIN SALG---------------------------------------
    {
        name="Salg af Kokain", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=200000,
        units_per_minute=50,
        x=917.33642578125,y=-1141.4606933594,z=24.67430305481,
        radius=5, height=1.5, -- area
        recipes = {
            ["Sælg Kokain"] = { -- action name
                description="Sælger Kokain, til kriminelle", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["kokain"] = 1
                }, -- items taken per unit
                products={
                    ["dirty_money"] = 700

                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------------HAK GULD---------------------------------------
    {
        name="Guldore", -- menu name
        permissions = {"miner.adgang"},
        r=0,g=255,b=0, -- color
        max_units=100000,
        units_per_minute=50,
        x=2936.8337402344,y=2744.1533203125,z=43.41520690918,
        radius=3, height=1.5, -- area
        recipes = {
            ["Hak Guldore"] = { -- action name
                description="Hakker Guldore", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={

                }, -- items taken per unit
                products={
                    ["guldmalm"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------------GULD FREMSTILLING---------------------------------------
    {
        name="Guld fremstilling", -- menu name'
        permissions = {"miner.adgang"},
        r=0,g=255,b=0, -- color
        max_units=100000,
        units_per_minute=20,
        x=1087.8717041016,y=-2001.9053955078,z=30.880701065063,
        radius=5, height=1.5, -- area
        recipes = {
            ["Lav Guldbar"] = { -- action name
                description="Laver Guldbar", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["guldmalm"]=1
                }, -- items taken per unit
                products={
                    ["guldbar"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------------PLUK VINDRUER---------------------------------------
    {
        name="Vindruer", -- menu name
        r=0,g=255,b=0, -- color
        max_units=100000,
        units_per_minute=50,
        x=-1868.3781738281,y=2177.0966796875,z=113.31826019287,
        radius=5, height=1.5, -- area
        recipes = {
            ["Pluk Vindruer"] = { -- action name
                description="Plukker vindruer", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                }, -- items taken per unit
                products={
                    ["vindruer"] = 10
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------------SALG AF VINDRUER---------------------------------------
    {
        name="Sælg Vindruer", -- menu name
        r=0,g=255,b=0, -- color
        max_units=100000,
        units_per_minute=50,
        x=1087.6127929688,y=6508.7119140625,z=21.055513381958,
        radius=5, height=1.5, -- area
        recipes = {
            ["Sælg Vindruer"] = { -- action name
                description="Sælger vindruer", -- action description
                in_money=0, -- money taken per unit
                out_money=60, -- money earned per unit
                reagents={
                    ["vindruer"] = 10
                }, -- items taken per unit
                products={
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------------SALG AF GULD---------------------------------------
    {
        name="Sælg guld", -- menu name
        permissions = {"miner.adgang"},
        r=0,g=255,b=0, -- color
        max_units=200000,
        units_per_minute=50,
        x=107.78172302246,y=-934.28332519532,z=29.774265289306,
        radius=5, height=1.5, -- area
        recipes = {
            ["Sælg Guldbar"] = { -- action name
                description="Sælger Guldbar", -- action description
                in_money=0, -- money taken per unit
                out_money=1000, -- money earned per unit
                reagents={
                    ["guldbar"] = 1
                }, -- items taken per unit
                products={

                }, -- items given per unit
                aptitudes={ -- optional
                }
            }
        }
    },

    ---------------------------------------HAK KUL---------------------------------------
    {
        name="Kul", -- menu name
        permissions = {"miner.adgang"},
        r=0,g=255,b=0, -- color
        max_units=20000,
        units_per_minute=1,
        x=2912.7639160156,y=2784.1264648438,z=44.68078994751,
        radius=4, height=1.5, -- area
        recipes = {
            ["Hak Kul"] = { -- action name
                description="Hakker Kul", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={

                }, -- items taken per unit
                products={
                    ["kul"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------------DIAMANT FREMSTILLING---------------------------------------
    {
        name="Diamant fremstilling", -- menu name
        permissions = {"miner.adgang"},
        r=0,g=255,b=0, -- color
        max_units=20000,
        units_per_minute=2,
        x=1108.8762207032,y=-2007.5161132812,z=30.903173446656,
        radius=5, height=1.5, -- area
        recipes = {
            ["Lav Diamanter"] = { -- action name
                description="Laver Diamanter", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["kul"]=3
                }, -- items taken per unit
                products={
                    ["diamant"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------------HUG TRÆ---------------------------------------
    {
        name="Hug træ", -- menu name
        permissions = {"skovhugger.adgang"},
        r=0,g=255,b=0, -- color
        max_units=20000,
        units_per_minute=5,
        x=-1586.6834716797,y=4700.263671875,z=45.322353363037,
        radius=7.5, height=1.5, -- area
        recipes = {
            ["Hugger træer"] = { -- action name
                description="Hugger træ", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                }, -- items taken per unit
                products={
                    ["træ"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------------LAV PLANKER---------------------------------------
    {
        name="Lav Planker", -- menu name
        permissions = {"skovhugger.adgang"},
        r=0,g=255,b=0, -- color
        max_units=20000,
        units_per_minute=5,
        x=-525.5380859375,y=5290.7846679688,z=74.174438476563,
        radius=5, height=1.5, -- area
        recipes = {
            ["Laver Planker"] = { -- action name
                description="Laver Planker", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["træ"] = 2
                }, -- items taken per unit
                products={
                    ["planke"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------------SÆLG PLANKER---------------------------------------
    {
        name="Sælg Planker", -- menu name
        permissions = {"skovhugger.adgang"},
        r=0,g=255,b=0, -- color
        max_units=20000,
        units_per_minute=5,
        x=27.032907485962,y=3636.0126953125,z=40.029407501221,
        radius=5, height=1.5, -- area
        recipes = {
            ["Sælg Planker"] = { -- action name
                description="Sælg Planker", -- action description
                in_money=0, -- money taken per unit
                out_money=200, -- money earned per unit
                reagents={
                    ["planke"] = 1
                }, -- items taken per unit
                products={
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------------SÆLG DIAMANTER---------------------------------------
    {
        name="Sælg Diamanter", -- menu name
        permissions = {"miner.adgang"},
        r=0,g=255,b=0, -- color
        max_units=200000,
        units_per_minute=50,
        x=-622.01745605468,y=-230.66743469238,z=38.057067871094,
        radius=5, height=1.5, -- area
        recipes = {
            ["Sælg Diamanter"] = { -- action name
                description="Sælger Diamanter", -- action description
                in_money=0, -- money taken per unit
                out_money=1500, -- money earned per unit
                reagents={
                    ["diamant"] = 1
                }, -- items taken per unit
                products={

                }, -- items given per unit
                aptitudes={ -- optional
                }
            }
        }
    },
    ---------------------------------------HVIDVASKNING---------------------------------------
    {
        name="Hvidvask", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=50000,
        units_per_minute=500,
        x=1118.2707519531,y=-3196.4858398438,z=-40.398254394531,
        radius=5, height=1.5, -- area
        recipes = {
            ["Hvidvask penge"] = { -- action name
                description="Hvidvask 8500 sorte >> 5000kr.", -- action description
                in_money=0, -- money taken per unit
                out_money=5000, -- money earned per unit
                reagents={
                    ["dirty_money"] = 8500
                }, -- items taken per unit
                products={
                }, -- items given per unit
                aptitudes={ -- optional
                }
            }
        }
    },

    ---------------------------------------FÆLD TRÆER 1---------------------------------------
    {
        name="Fæld træer 1",
        permissions = {"skovhugger.adgang"},
        r=0,g=255,b=0, -- color
        max_units=50000,
        units_per_minute=35,
        x=-471.65469360352,y=5579.6635742188,z=71.06226348877,
        radius=12, height=4,
        recipes = {
            ["Fæld træet"] = {
                description="Fæld træet her",
                in_money=0,
                out_money=0,
                reagents={},
                products={
                    ["logs"] = 2
                }, -- items given per unit
                aptitudes={

                }
            }
        }
    },
    ---------------------------------------FÆLD TRÆER 2---------------------------------------
    {
        name="Fæld træer 2",
        permissions = {"skovhugger.adgang"},
        r=0,g=255,b=0, -- color
        max_units=50000,
        units_per_minute=35,
        x=-556.00494384766,y=5852.3452148438,z=32.465419769287,
        radius=12, height=4,
        recipes = {
            ["Fæld træet"] = {
                description="Fæld træet her",
                in_money=0,
                out_money=0,
                reagents={
                },
                products={
                    ["logs"] = 3
                }, -- items given per unit
                aptitudes={

                }
            }
        }
    },
    ---------------------------------------FÆLD TRÆER (HEMMELIG)---------------------------------------
    {
        name="Fæld træer 3 (Hemmelig)",
        permissions = {"skovhugger.adgang"},
        r=0,g=255,b=0, -- color
        max_units=50000,
        units_per_minute=35,
        x=-618.98742675781,y=5942.626953125,z=21.707723617554,
        radius=12, height=4,
        recipes = {
            ["Fæld træet"] = {
                description="Fæld træet her",
                in_money=0,
                out_money=0,
                reagents={
                },
                products={
                    ["logs"] = 6
                }, -- items given per unit
                aptitudes={
                }
            }
        }
    },
    ---------------------------------------OMSÆRING AF TRÆ (HEMMELIG)---------------------------------------
    {
        name="Omskær træ 1 (Hemmelig)",
        permissions = {"skovhugger.adgang"},
        r=0,g=255,b=0, -- color
        max_units=50000,
        units_per_minute=35,
        x=-475.5412902832,y=5304.0541992188,z=86.496353149414,
        radius=12, height=4,
        recipes = {
            ["Omskær træet"] = {
                description="omskær træet her",
                in_money=0,
                out_money=0,
                reagents={
                    ["logs"] = 2
                },
                products={
                    ["fplanke"] = 6
                }, -- items given per unit
                aptitudes={
                }
            }
        }
    },
    ---------------------------------------OMSKÆRING AF TRÆ---------------------------------------
    {
        name="Omskær træ 1",
        permissions = {"skovhugger.adgang"},
        r=0,g=255,b=0, -- color
        max_units=50000,
        units_per_minute=35,
        x=-532.38616943359,y=5293.0532226563,z=74.195243835449,
        radius=12, height=4,
        recipes = {
            ["Omskær træet"] = {
                description="omskær træet her",
                in_money=0,
                out_money=0,
                reagents={
                    ["logs"] = 2
                },
                products={
                    ["fplanke"] = 4
                }, -- items given per unit
                aptitudes={
                }
            }
        }
    },
    ---------------------------------------SALG AF TRÆ---------------------------------------
    {
        name="Sælg træ ",
        permissions = {"skovhugger.adgang"},
        r=0,g=255,b=0, -- color
        max_units=50000,
        units_per_minute=35,
        x=-307.99395751953,y=-1198.5562744141,z=24.629217147827,
        radius=12, height=4,
        recipes = {
            ["Sælg træet"] = {
                description="sælg træet her",
                in_money=0,
                out_money=5000,
                reagents={
                    ["fplanke"] = 5
                },
                products={}, -- items given per unit
                aptitudes={
                }
            }
        }
    },

    ---------------------------------------PRODUCER NAOH---------------------------------------

    {
        name="Producer NaOH", -- menu name
        permissions = {"kriminel.adgang"}, -- you can add permissions
        r=0,g=121,b=28, -- color
        max_units=100000,
        units_per_minute=1000,
        x=3559.0317382813,y=3672.3293457031,z=28.121856689453,
        radius=3, height=2, -- area
        recipes = {
            ["NaOH"] = { -- action name
                description="Producer NaOH", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["natrium"]=1,
                    ["water"]=1,
                }, -- items taken per unit
                products={
                    ["naoh"]=1,
                },  -- items given per unit
                aptitudes={}, -- optional = 1 -- "group.aptitude", give 1 exp per unit
            }
        }
    },
    ---------------------------------------PRODUCER AMFETAMIN---------------------------------------
    {
        name="Producer amfetamin", -- menu name
        permissions = {"kriminel.adgang"}, -- you can add permissions
        r=0,g=121,b=28, -- color
        max_units=100000,
        units_per_minute=1000,
        x=1092.9554443359,y=-3194.8947753906,z=-38.993473052979,
        radius=3, height=2, -- area
        recipes = {
            ["Producer"] = { -- action name
                description="Producer amfetamin", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["naoh"]=1,
                    ["p2np"]=1,
                    ["isopropanol"]=1,
                    ["sølvpapir"]=1,
                    ["eddikesyre"]=1,
                    ["h2so4"]=1,
                }, -- items taken per unit
                products={
                    ["amfetamin"]=1,
                },  -- items given per unit
                aptitudes={}, -- optional = 1 -- "group.aptitude", give 1 exp per unit
            }
        }
    },
    ---------------------------------------SALG AF AMFETAMIN---------------------------------------
    {
        name="Sælg Amfetamin", -- menu name
        permissions = {"kriminel.adgang"}, -- you can add permissions
        r=0,g=121,b=28, -- color
        max_units=50000,
        units_per_minute=100,
        x=1661.0538330078,y=1.421401143074,z=166.11820983887,
        radius=5, height=1.5, -- area
        recipes = {
            ["Amfetamin"] = { -- action name
                description="Sælg Amfetamin", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["amfetamin"]=1,
                }, -- items taken per unit
                products={
                    ["dirty_money"] = 1150,
                },  -- items given per unit
                aptitudes={}, -- optional = 1 -- "group.aptitude", give 1 exp per unit
            }
        }
    },
    ---------------------------------------GENBRUG MEKANIKER ROD---------------------------------------

    {
        name="Genbrug mekaniker rod", -- menu name
        permissions = {"mekaniker.adgang"},
        r=255,g=255,b=255, -- color
        max_units=100000,
        units_per_minute=1000,
        x=-467.84881591797,y=-1717.9417724609,z=18.689134597778,
        radius=2, height=1.5, -- area
        recipes = {
            ["Genbruger rod"] = { -- action name
                description="Sælg dit mekaniker rod til fabrikken.", -- action description
                work=0.2,
                in_money=0, -- money taken per unit
                out_money=175, -- money earned per unit
                reagents={
                    ["rod"] = 1,
                }, -- items taken per unit
                products={}, -- items given per unit},
                aptitudes={}, -- optional = 1 -- "group.aptitude", give 1 exp per unit
            }
        }
    },
    ---------------------------------------SALG AF LSD---------------------------------------

    {
        name="Sælg LSD", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=50000,
        units_per_minute=250,
        x=2290.0236816406,y=4875.4848632813,z=41.808265686035,
        radius=2, height=1.5, -- area
        recipes = {
            ["Sælg LSD"] = { -- action name
                description="Sælger LSD", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["lsd"] = 1
                }, -- items taken per unit
                products={
                    ["dirty_money"] = 800
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------LSD FREMSTILLING---------------------------
    {
        name="Fremstilling af LSD", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=50000,
        units_per_minute=250,
        x=-165.78091430664,y=6141.0639648438,z=31.397089004517,
        radius=2, height=1.5, -- area
        recipes = {
            ["Fremstil LSD"] = { -- action name
                description="Fremstil LSD", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["syre"] = 2
                }, -- items taken per unit
                products={
                    ["lsd"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------FREMSTIL MORFIN---------------------------
            {
        name="Morfin Fremstilling", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=50000,
        units_per_minute=20,
        x=1974.8269042969,y=3818.2858886719,z=33.43635559082,
        radius=2, height=1.5, -- area
        recipes = {
            ["Fremstil Herionsprøjter"] = { -- action name
                description="Fremstiller Herionsprøjter", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["morfin"] = 1,
                    ["opium"] = 2,
                    ["sprøjte"] = 1
                        }, -- items taken per unit
                        products={
                            ["herionsprøjte"] = 1
                        }, -- items given per unit
                        aptitudes={ -- optional
                        }, -- items given per unit
                        aptitudes={ -- optional
    
                    }
                }
            }
        },

    ---------------------------------------SALG AF HERIONSPRØTJER---------------------------------------
     {
        name="Sælg HerionSprøjter", -- menu name
        permissions = {"kriminel.adgang"}, -- you can add permissions
        r=0,g=121,b=28, -- color
        max_units=50000,
        units_per_minute=100,
        x=152.41522216797,y=-1194.2806396484,z=29.321176528931,
        radius=5, height=1.5, -- area
        recipes = {
            ["HerionSprøjter"] = { -- action name
                description="Sælg HerionSprøjter", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    ["herionsprøjte"]=1,
                }, -- items taken per unit
                products={
                    ["dirty_money"] = 950
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    },
    ---------------------------------HØST MORFIN---------------------------
                {
                name="Morfin", -- menu name
                permissions = {"kriminel.adgang"},
                r=0,g=255,b=0, -- color
                max_units=50000,
                units_per_minute=20,
                x=3615.5551757813,y=5023.4287109375,z=11.404563903809,
                radius=2, height=1.5, -- area
                recipes = {
                    ["Høst Morfin"] = { -- action name
                        description="Høster Morfin, kan bruges til at lave Herionspørtjer", -- action description
                        in_money=0, -- money taken per unit
                        out_money=0, -- money earned per unit
                        reagents={
                            }, -- items taken per unit
                            products={
                                ["morfin"] = 1
                            }, -- items given per unit
                            aptitudes={ -- optional

                        }
                    }
                }
            },

    ---------------------------------------FARMING AF OPIUM---------------------------------------
    {
        name="Opium", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=50000,
        units_per_minute=20,
        x=-98.20352935791,y=1910.2629394531,z=196.85675048828,
        radius=2, height=1.5, -- area
        recipes = {
            ["Høst Opium"] = { -- action name
                description="Høster Opium, kan bruges til at lave Herionspørtjer", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                    }, -- items taken per unit
                    products={
                        ["opium"] = 1
                    }, -- items given per unit
                    aptitudes={ -- optional

                }
            }
        }
    },

    ---------------------------------------HØST SYRE---------------------------------------
    {
        name="Kog Syre", -- menu name
        permissions = {"kriminel.adgang"},
        r=0,g=255,b=0, -- color
        max_units=30000,
        units_per_minute=20,
        x=1005.5866088867,y=-3200.4182128906,z=-38.519420623779,
        radius=3, height=1.5, -- area
        recipes = {
            ["Høst Syre"] = { -- action name
                description="Høster Syre", -- action description
                in_money=0, -- money taken per unit
                out_money=0, -- money earned per unit
                reagents={
                }, -- items taken per unit
                products={
                    ["syre"] = 1
                }, -- items given per unit
                aptitudes={ -- optional

                }
            }
        }
    }
}


-- define transformers randomly placed on the map
cfg.hidden_transformers = {

}

-- time in minutes before hidden transformers are relocated (min is 5 minutes)
cfg.hidden_transformer_duration = 5*24*60 -- 5 days

-- configure the information reseller (can sell hidden transformers positions)
cfg.informer = {
    infos = {},
    positions = {},
    interval = 60, -- interval in minutes for the reseller respawn
    duration = 10, -- duration in minutes of the spawned reseller
    blipid = 133,
    blipcolor = 2
}

return cfg