//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(identifier: "com.danieljvdm.Coffee") ?? Bundle.main
  
  static func validate() throws {
    try font.validate()
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 11 files.
  struct file {
    /// Resource file `ProximaNova-Bold.otf`.
    static let proximaNovaBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "ProximaNova-Bold", pathExtension: "otf")
    /// Resource file `ProximaNova-Extrabold.otf`.
    static let proximaNovaExtraboldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "ProximaNova-Extrabold", pathExtension: "otf")
    /// Resource file `ProximaNova-Regular.otf`.
    static let proximaNovaRegularOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "ProximaNova-Regular", pathExtension: "otf")
    /// Resource file `ProximaNova-Semibold.otf`.
    static let proximaNovaSemiboldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "ProximaNova-Semibold", pathExtension: "otf")
    /// Resource file `bluebottle.jpg`.
    static let bluebottleJpg = Rswift.FileResource(bundle: R.hostingBundle, name: "bluebottle", pathExtension: "jpg")
    /// Resource file `brooklyn.jpg`.
    static let brooklynJpg = Rswift.FileResource(bundle: R.hostingBundle, name: "brooklyn", pathExtension: "jpg")
    /// Resource file `intelligentsia.jpg`.
    static let intelligentsiaJpg = Rswift.FileResource(bundle: R.hostingBundle, name: "intelligentsia", pathExtension: "jpg")
    /// Resource file `ios-linen.jpg`.
    static let iosLinenJpg = Rswift.FileResource(bundle: R.hostingBundle, name: "ios-linen", pathExtension: "jpg")
    /// Resource file `laughingman.jpg`.
    static let laughingmanJpg = Rswift.FileResource(bundle: R.hostingBundle, name: "laughingman", pathExtension: "jpg")
    /// Resource file `stumptown.jpg`.
    static let stumptownJpg = Rswift.FileResource(bundle: R.hostingBundle, name: "stumptown", pathExtension: "jpg")
    /// Resource file `tobysestate.jpg`.
    static let tobysestateJpg = Rswift.FileResource(bundle: R.hostingBundle, name: "tobysestate", pathExtension: "jpg")
    
    /// `bundle.url(forResource: "ProximaNova-Bold", withExtension: "otf")`
    static func proximaNovaBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.proximaNovaBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "ProximaNova-Extrabold", withExtension: "otf")`
    static func proximaNovaExtraboldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.proximaNovaExtraboldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "ProximaNova-Regular", withExtension: "otf")`
    static func proximaNovaRegularOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.proximaNovaRegularOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "ProximaNova-Semibold", withExtension: "otf")`
    static func proximaNovaSemiboldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.proximaNovaSemiboldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "bluebottle", withExtension: "jpg")`
    static func bluebottleJpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.bluebottleJpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "brooklyn", withExtension: "jpg")`
    static func brooklynJpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.brooklynJpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "intelligentsia", withExtension: "jpg")`
    static func intelligentsiaJpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.intelligentsiaJpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "ios-linen", withExtension: "jpg")`
    static func iosLinenJpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.iosLinenJpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "laughingman", withExtension: "jpg")`
    static func laughingmanJpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.laughingmanJpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "stumptown", withExtension: "jpg")`
    static func stumptownJpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.stumptownJpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "tobysestate", withExtension: "jpg")`
    static func tobysestateJpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.tobysestateJpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 4 fonts.
  struct font: Rswift.Validatable {
    /// Font `ProximaNova-Bold`.
    static let proximaNovaBold = Rswift.FontResource(fontName: "ProximaNova-Bold")
    /// Font `ProximaNova-Extrabld`.
    static let proximaNovaExtrabld = Rswift.FontResource(fontName: "ProximaNova-Extrabld")
    /// Font `ProximaNova-Regular`.
    static let proximaNovaRegular = Rswift.FontResource(fontName: "ProximaNova-Regular")
    /// Font `ProximaNova-Semibold`.
    static let proximaNovaSemibold = Rswift.FontResource(fontName: "ProximaNova-Semibold")
    
    /// `UIFont(name: "ProximaNova-Bold", size: ...)`
    static func proximaNovaBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: proximaNovaBold, size: size)
    }
    
    /// `UIFont(name: "ProximaNova-Extrabld", size: ...)`
    static func proximaNovaExtrabld(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: proximaNovaExtrabld, size: size)
    }
    
    /// `UIFont(name: "ProximaNova-Regular", size: ...)`
    static func proximaNovaRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: proximaNovaRegular, size: size)
    }
    
    /// `UIFont(name: "ProximaNova-Semibold", size: ...)`
    static func proximaNovaSemibold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: proximaNovaSemibold, size: size)
    }
    
    static func validate() throws {
      if R.font.proximaNovaSemibold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'ProximaNova-Semibold' could not be loaded, is 'ProximaNova-Semibold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.proximaNovaExtrabld(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'ProximaNova-Extrabld' could not be loaded, is 'ProximaNova-Extrabold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.proximaNovaRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'ProximaNova-Regular' could not be loaded, is 'ProximaNova-Regular.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.proximaNovaBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'ProximaNova-Bold' could not be loaded, is 'ProximaNova-Bold.otf' added to the UIAppFonts array in this targets Info.plist?") }
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 8 images.
  struct image {
    /// Image `TwitterIcon`.
    static let twitterIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "TwitterIcon")
    /// Image `bluebottle.jpg`.
    static let bluebottleJpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "bluebottle.jpg")
    /// Image `brooklyn.jpg`.
    static let brooklynJpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "brooklyn.jpg")
    /// Image `intelligentsia.jpg`.
    static let intelligentsiaJpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "intelligentsia.jpg")
    /// Image `ios-linen.jpg`.
    static let iosLinenJpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "ios-linen.jpg")
    /// Image `laughingman.jpg`.
    static let laughingmanJpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "laughingman.jpg")
    /// Image `stumptown.jpg`.
    static let stumptownJpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "stumptown.jpg")
    /// Image `tobysestate.jpg`.
    static let tobysestateJpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "tobysestate.jpg")
    
    /// `UIImage(named: "TwitterIcon", bundle: ..., traitCollection: ...)`
    static func twitterIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.twitterIcon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "bluebottle.jpg", bundle: ..., traitCollection: ...)`
    static func bluebottleJpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.bluebottleJpg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "brooklyn.jpg", bundle: ..., traitCollection: ...)`
    static func brooklynJpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.brooklynJpg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "intelligentsia.jpg", bundle: ..., traitCollection: ...)`
    static func intelligentsiaJpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.intelligentsiaJpg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ios-linen.jpg", bundle: ..., traitCollection: ...)`
    static func iosLinenJpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iosLinenJpg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "laughingman.jpg", bundle: ..., traitCollection: ...)`
    static func laughingmanJpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.laughingmanJpg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "stumptown.jpg", bundle: ..., traitCollection: ...)`
    static func stumptownJpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.stumptownJpg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "tobysestate.jpg", bundle: ..., traitCollection: ...)`
    static func tobysestateJpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tobysestateJpg, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `shopCell`.
    static let shopCell: Rswift.ReuseIdentifier<ShopCell> = Rswift.ReuseIdentifier(identifier: "shopCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
    }
    
    struct main: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let homeScreen = StoryboardViewControllerResource<ShopsVC>(identifier: "HomeScreen")
      let name = "Main"
      let shopDetail = StoryboardViewControllerResource<ShopDetailVC>(identifier: "ShopDetail")
      
      func homeScreen(_: Void = ()) -> ShopsVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: homeScreen)
      }
      
      func shopDetail(_: Void = ()) -> ShopDetailVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: shopDetail)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "stumptown.jpg") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'stumptown.jpg' is used in storyboard 'Main', but couldn't be loaded.") }
        if _R.storyboard.main().shopDetail() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'shopDetail' could not be loaded from storyboard 'Main' as 'ShopDetailVC'.") }
        if _R.storyboard.main().homeScreen() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'homeScreen' could not be loaded from storyboard 'Main' as 'ShopsVC'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}