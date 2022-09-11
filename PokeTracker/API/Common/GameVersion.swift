//
// Created by Joakim Stien on 11/09/2022.
//

import Foundation

enum GameVersion: String, Codable, Identifiable, Hashable {
    case red
    case blue
    case yellow
    case gold
    case silver
    case crystal
    case ruby
    case sapphire
    case emerald
    case firered
    case leafgreen
    case diamond
    case pearl
    case platinum
    case heartgold
    case soulsilver
    case black
    case white
    case colosseum
    case xd
    case black2 = "black-2"
    case white2 = "white-2"
    case x
    case y
    case omegaRuby = "omega-ruby"
    case alphaSapphire = "alpha-sapphire"
    case sun
    case moon
    case ultraSun = "ultra-sun"
    case ultraMoon = "ultra-moon"
    case letsGoPikachu = "lets-go-pikachu"
    case letsGoEevee = "lets-go-eevee"
    case sword
    case shield
    case theIsleOfArmor = "the-isle-of-armor"
    case theCrownTundra = "the-crown-tundra"
    case brilliantDiamond = "brilliant-diamond"
    case shiningPearl = "shining-pearl"
    case legendsArceus = "legends-arceus"


    var id: String { self.rawValue }
    var name: String {
        switch self {
        case .red: return "Red"
        case .blue: return "Blue"
        case .yellow: return "Yellow"
        case .gold: return "Gold"
        case .silver: return "Silver"
        case .crystal: return "Crystal"
        case .ruby: return "Ruby"
        case .sapphire: return "Sapphire"
        case .emerald: return "Emerald"
        case .firered: return "Fire Red"
        case .leafgreen: return "Leaf Green"
        case .diamond: return "Diamond"
        case .pearl: return "Pearl"
        case .platinum: return "Platinum"
        case .heartgold: return "Heart Gold"
        case .soulsilver: return "Soul Silver"
        case .black: return "Black"
        case .white: return "White"
        case .colosseum: return "Colosseum"
        case .xd: return "XD"
        case .black2: return "Black 2"
        case .white2: return "White 2"
        case .x: return "X"
        case .y: return "Y"
        case .omegaRuby: return "Omega Ruby"
        case .alphaSapphire: return "Alpha Sapphire"
        case .sun: return "Sun"
        case .moon: return "Moon"
        case .ultraSun: return "Ultra Sun"
        case .ultraMoon: return "Ultra Moon"
        case .letsGoPikachu: return "Let's Go Pikachu"
        case .letsGoEevee: return "Let's Go Eevee"
        case .sword: return "Sword"
        case .shield: return "Shield"
        case .theIsleOfArmor: return "The Isle of Armor"
        case .theCrownTundra: return "The Crown Tundra"
        case .brilliantDiamond: return "Brilliant Diamond"
        case .shiningPearl: return "Shining Pearl"
        case .legendsArceus: return "Legends Arceus"
        }
    }
}
