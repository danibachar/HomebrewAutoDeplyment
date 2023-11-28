class TuistenvAt004 < Formula
    desc "Managing Tuist versions"
    homepage "https://tuist.io"
    url "https://github.com/danibachar/tuist/archive/refs/tags/4.0.0.tar.gz"
    sha256 "48ef78b5102209e913f073c711e4164c2ab90babfde7fbcddd9ed4908a24a4ea"
    license "MIT"
    head "https://github.com/tuist/tuist.git", branch: "main"
  
    # https://github.com/tuist/tuist/blob/3.33.4/.xcode-version#L1
    depends_on xcode: ["14.3", :build]
  
    # https://github.com/tuist/tuist/blob/3.33.4/Package.swift#L14
    depends_on macos: :monterey
  
    def install
      # https://github.com/tuist/tuist/blob/3.33.4/.github/workflows/tuist.yml#L83
      system "swift", "build",
        "--configuration", "release",
        "--product", "tuistenv",
        "--disable-sandbox"
  
      bin.install ".build/release/tuistenv"
    end
  end
  
