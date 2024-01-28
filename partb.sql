CREATE TABLE User (
    userId VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    emailAddress VARCHAR(255)
);
INSERT INTO User (userId, name, emailAddress) VALUES
('simon3', 'Simon, S', 'simon3@hotmail.co.uk'),
('talia11', 'Talia, J', 'talia11@ntl.co.uk'),
('toby05', 'Toby, T', 'toby05@freeserve.co.uk'),
('margot9', 'Margot, C', 'margot9@msn.co.uk'),
('ethan77', 'Ethan, R', 'ethan77@hotmail.co.uk'),
('nancy91', 'Nancy, L', 'nancy91@tesco.co.uk');

SELECT * from User;

CREATE TABLE Movie (
    movieId VARCHAR(5) PRIMARY KEY,
    title VARCHAR(255),
    categoryCode VARCHAR(5),
    costPerDownload DECIMAL(5, 2)
);
INSERT INTO Movie (movieId, title, categoryCode, costPerDownload) VALUES
('M001', 'The Imitation Game', 'MO13', 0.99),
('M002', 'The Duchess', 'MO13', 1.99),
('M003', 'Trainspotting', 'MO11', 1.49),
('M004', 'The Dig', 'MO11', 1.79),
('M005', 'Elizabeth', 'MO13', 1.50),
('M006', 'Sherlock Holmes', 'MO12', 1.10),
('M007', 'Moon', 'MO12', 0.89);

SELECT * from Movie;

CREATE TABLE DownloadMovie (
    userId VARCHAR(10),
    movieId VARCHAR(5),
    downloadDate DATE
);
INSERT INTO DownloadMovie (userId, movieId, downloadDate) VALUES
('simon3', 'M002', '2021-05-03'),
('margot9', 'M005', '2022-05-01'),
('talia11', 'M002', '2021-05-06'),
('margot9', 'M001', '2022-05-06'),
('simon3', 'M003', '2022-08-01'),
('ethan77', 'M004', '2022-08-02'),
('nancy91', 'M007', '2021-09-05');

SELECT * from DownloadMovie;

CREATE TABLE Category (
    categoryCode VARCHAR(5) PRIMARY KEY,
    title VARCHAR(255)
);
INSERT INTO Category (categoryCode, title) VALUES
('MO11', 'Drama'),
('MO12', 'Fiction'),
('MO13', 'Biopic');

SELECT * from Category;

SELECT movieId, title, categoryCode
FROM Movie
ORDER BY title;

SELECT COUNT(DISTINCT U.userId) AS NumberOfUsers
FROM User U
JOIN DownloadMovie DM ON U.userId = DM.userId
JOIN Movie M ON DM.movieId = M.movieId
WHERE M.categoryCode = 'Pop-Rock';

SELECT C.title AS CategoryTitle, COUNT(DM.movieId) AS NumberOfDownloads
FROM Category C
LEFT JOIN Movie M ON C.categoryCode = M.categoryCode
LEFT JOIN DownloadMovie DM ON M.movieId = DM.movieId
GROUP BY C.title;


SELECT C.title AS CategoryTitle
FROM Category C
JOIN Movie M ON C.categoryCode = M.categoryCode
JOIN DownloadMovie DM ON M.movieId = DM.movieId
GROUP BY C.title
HAVING COUNT(DISTINCT DM.movieId) > 1;



