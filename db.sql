-- 管理員 (Admin)
CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,  -- 加密的密碼
    Email VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 攝影公司 (PhotographyCompany)
CREATE TABLE PhotographyCompany (
    CompanyID INT AUTO_INCREMENT PRIMARY KEY,
    AdminID INT,
    CompanyName VARCHAR(255) NOT NULL,
    CompanyInfo TEXT,
    Logo VARCHAR(255),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

-- 攝影師 (Photographer)
CREATE TABLE Photographer (
    PhotographerID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyID INT,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,  -- 加密的密碼
    Email VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CompanyID) REFERENCES PhotographyCompany(CompanyID)
);

-- 相簿 (Album)
CREATE TABLE Album (
    AlbumID INT AUTO_INCREMENT PRIMARY KEY,
    PhotographerID INT,
    AlbumName VARCHAR(255) NOT NULL,
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ExpiryDate DATE,
    RandomURL VARCHAR(255) NOT NULL,
    FOREIGN KEY (PhotographerID) REFERENCES Photographer(PhotographerID)
);

-- 照片 (Photo)
CREATE TABLE Photo (
    PhotoID INT AUTO_INCREMENT PRIMARY KEY,
    AlbumID INT,
    PhotoPath VARCHAR(255) NOT NULL,
    ThumbnailPath VARCHAR(255),
    UploadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID)
);

-- 使用者統計 (UserStats)
CREATE TABLE UserStats (
    StatsID INT AUTO_INCREMENT PRIMARY KEY,
    PhotographerID INT,
    TotalAlbums INT DEFAULT 0,
    TotalStorageUsed FLOAT DEFAULT 0,  -- 使用的存儲空間，使用浮點數表示，單位可以是MB
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PhotographerID) REFERENCES Photographer(PhotographerID)
);

-- 音樂 (Music)
CREATE TABLE Music (
    MusicID INT AUTO_INCREMENT PRIMARY KEY,
    AlbumID INT,
    MusicPath VARCHAR(255) NOT NULL,
    UploadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID)
);

