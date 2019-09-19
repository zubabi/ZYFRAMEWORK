Pod::Spec.new do |spec|

spec.name         = "ZYFramework"
spec.version      = "1.0.1"
spec.summary      = "ZYFramework is library just for testing"
spec.description  = "ZYFramework is library just for testing description"
spec.homepage     = "https://github.com/zubabi/ZYFramework"
spec.license      = "MIT"
spec.author       = { "Zubeyir Yayıkçı" => "zubabi@gmail.com" }
spec.platform     = :ios, "10.0"
spec.source       = { :git => "https://github.com/zubabi/ZYFramework.git", :tag => "1.0.1" }
spec.source_files  = "ZYFramework/**/*.swift"
#spec.public_header_files  = "ZYFramework/**/*"
spec.swift_versions= "4.0"
end

