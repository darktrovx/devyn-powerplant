Config = {}

Config.PowerStations = {
    ["CityPower"] = {
        ["Cooldown"] = 60, -- : SECONDS : How long before the power is repaired
        ["AmountToDisable"] = 3, -- How many fuse boxes to disable the power.
        ["time"] = 10, -- : SECONDS : how long to complete the minigame.
        ["size"] = 4, -- Size of the thermite game.
        ["incorrect"] = 3, -- Number of incorrect blocks before failing.
        ["FuseBoxes"] = {
            [1] ={
                coords = vector4(708.85, 117.24, 81.02, 159.00),
                particles = vector4(708.95, 117.21, 81.29, 155.3),
                
            },
            [2] = {
                coords = vector4(703.08, 119.36, 81.04, 159.00),
                particles = vector4(703.17, 119.33, 81.29, 163.04),
            },
            [3] = {
                coords = vector4(697.44, 103.98, 81.02, 159.00),
                particles = vector4(697.51, 103.95, 81.3, 167.78),
            },
            [4] = {
                coords = vector4(703.21, 101.86, 81.03, 159.00),
                particles = vector4(703.29, 101.83, 81.29, 168.5),
            },
            [5] = {
                coords = vector4(682.46, 117.0, 80.99, 159.00),
                particles = vector4(682.56, 116.97, 81.33, 136.3),
            },
            [6] = {
                coords = vector4(676.65, 119.02, 81.0, 159.00),
                particles = vector4(676.76, 118.98, 81.32, 164.46),
            },
            [7] = {
                coords = vector4(659.01, 115.06, 80.95, 159.00),
                particles = vector4(658.93, 115.09, 81.3, 347.53),
            },
            [8] = {
                coords = vector4(664.79, 113.0, 80.95, 159.00),
                particles = vector4(664.69, 113.03, 81.3, 339.38),
            },
            [9] = {
                coords = vector4(664.49, 130.5, 81.08, 159.00),
                particles = vector4(664.41, 130.52, 81.35, 4.52),
            },
            [10] = {
                coords = vector4(670.29, 128.43, 81.04, 159.00),
                particles = vector4(670.2, 128.46, 81.36, 343.23),
            },
            [11] = {
                coords = vector4(692.48, 142.47, 80.96, 159.00),
                particles = vector4(692.57, 142.44, 81.3, 164.72),
            },
            [12] = {
                coords = vector4(686.66, 144.49, 81.03, 159.00),
                particles = vector4(686.77, 144.45, 81.29, 137.02),
            },
            [13] = {
                coords = vector4(692.07, 159.95, 81.01, 159.00),
                particles = vector4(692.13, 159.93, 81.3, 162.49),
            },
            [14] = {
                coords = vector4(697.86, 157.94, 80.99, 159.00),
                particles = vector4(697.95, 157.91, 81.31, 142.04),
            },
            [15] = {
                coords = vector4(679.89, 171.44, 81.07, 159.00),
                particles = vector4(679.79, 171.47, 81.36, 342.06),
            },
            [16] = {
                coords = vector4(685.68, 169.37, 81.05, 159.00),
                particles = vector4(685.58, 169.41, 81.37, 5.92),
            },
        },
        ["Explosions"] = {
            vector4(684.93, 171.29, 83.23, 245.56),
            vector4(679.03, 173.45, 83.23, 75.67),
            vector4(673.57, 157.99, 83.16, 72.47),
            vector4(679.52, 155.98, 83.16, 253.7),
            vector4(698.74, 155.8, 84.17, 157.48),
            vector4(692.59, 157.85, 84.17, 2.11),
            vector4(687.06, 141.8, 83.92, 159.9),
            vector4(693.84, 140.09, 83.72, 254.24),
            vector4(683.05, 114.32, 83.43, 164.08),
            vector4(677.66, 116.95, 83.3, 66.36),
            vector4(664.38, 115.13, 83.83, 84.08),
            vector4(658.79, 117.3, 83.91, 71.63),
            vector4(698.65, 101.67, 83.76, 238.33),
            vector4(703.87, 99.95, 83.65, 251.24),
            vector4(709.92, 115.84, 83.42, 340.22),
            vector4(703.08, 117.35, 83.35, 80.3),
        }
    }
}