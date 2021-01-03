; v0.1 - <kgf@ee.ethz.ch> - Thu Oct 22 11:17:18 CEST 2015
;  - adapted from UMC65, still tons of questionable stuff
; 610 settings
envSetVal( "ui"  "webBrowser" 'string  "/usr/bin/firefox")
envSetVal( "graphic" "schematicDefaultApp" 'string  "Schematics XL")
envSetVal( "graphic" "maskLayoutDefaultApp"  'string  "Layout L")

; this prevents annoying pop ups
envSetVal( "designEditor.license"    "appsWhichAlwaysTryHigherTieredLicense",   'string  "ADE L, ADE XL, Schematics L,Layout L, Layout XL")

; after 6.13.515 the following will work
envSetVal( "license" "VLSL_UseNextLicense"   'string "always")
envSetVal( "license" "VLSXL_UseNextLicense"  'string "always")
envSetVal( "license" "VSEL_UseNextLicense"   'string "always")
envSetVal( "license" "ADEL_UseNextLicense"   'string "always")
envSetVal( "license" "ADEXL_UseNextLicense"  'string "always")

; even more funny things
envSetVal( "license" "VLSLicenseCheckoutOrder" 'string "L,XL,GXL")
envSetVal( "license" "VSELicenseCheckoutOrder" 'string "L,XL")
envSetVal( "license" "ADELicenseCheckoutOrder" 'string "L,XL,GXL")

; envSetVal( "layout"  "xSnapSpacing" 'float  0.005)
; envSetVal( "layout"  "ySnapSpacing" 'float  0.005)

; envSetVal( "graphic" "drfPath" 'string  ".tech/display.drf")

; new library should be linked to this tech library
tcNewLibAttachTechForm->attachTechLibList->value= '( "cmos32lp" )

loadContext(prependInstallPath("etc/context/transUI.cxt"))
; streamInKeys->layerTable="/usr/pack/umc-65-kgf/dz/dfii/610/tech/streamIn.map"
; streamInKeys->textFontTable="/usr/pack/umc-90-kgf/faraday.dz/dfii/5141/pipo/txtfont.tab"

; the following is to keep reference libraries
; streamInKeys->refLib=t
; streamInKeys->refLibOrder="<reference libraries>"

; streamOutKeys->layerTable="/usr/pack/umc-65-kgf/dz/dfii/610/tech/stream.map"
;streamOutKeys->textFontTable="/usr/pack/umc-90-kgf/faraday.dz/dfii/5141/pipo/txtfont.tab"
streamOutKeys->runDirectory="."
streamOutKeys->errorMessageFile="PIPO.LOG"

