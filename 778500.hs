--
-- Discrete Mathematics and Functional Programming
-- Haskell Coursework: Film Database (Weiver - revieW)
-- Student ID: 778500
--

-- // Imports :

import Data.List
import Data.Char
import Text.Printf

--  // Types :

type Title = String
type Director = String
type Year = Int
type Fan = String
type Fans = [Fan]
type Film = (Title, Director, Year, Fans)
type Database = [Film]

--  // Functionality :

-- Add a new film to the database
addFilm :: Title -> Director -> Year -> Database -> Database
addFilm ti dir yr db = db++[(ti, dir, yr, [])]

-- Return testDatabase which includes all Films
getAllFilms :: Database -> IO ()
getAllFilms database = putStrLn (filmsAsString database)

-- Return all films by a given Director
getFilmsByDirector :: Database -> Director -> Database
getFilmsByDirector database dirQ = [(ti,dir,yr,fan) | (ti,dir,yr,fan) <- database, dir == dirQ]

-- Return testDatabase with films only after certain date

-- // H-Functions :
displayListAsString :: [String] -> String
displayListAsString [] = ""
displayListAsString (x:[]) = x ++ displayListAsString []
displayListAsString (x:xs) = x ++ ", " ++ displayListAsString xs


filmsAsString :: Database -> String
filmsAsString [] = ""
filmsAsString ((ti,dir,yr,fan):rest) = "\n Title: " ++ ti ++ "\n Director: " ++ dir ++ "\n Year: " ++ show yr ++ "\n Fans: " ++ (displayListAsString fan) ++ "\n" ++ filmsAsString rest


-- Demo function to test basic functionality (without persistence - i.e. 
-- testDatabase doesn't change and nothing is saved/loaded to/from file).

--demo :: Int -> IO ()
--demo 1  = putStrLn all films after adding 2018 film "Sherlock Gnomes" 
--          directed by by "John Stevenson" to testDatabase
--demo 2  = putStrLn (filmsAsString testDatabase)
--demo 3  = putStrLn all films by "Ridley Scott"
--demo 4  = putStrLn all films with website rating >= 75%
--demo 5  = putStrLn average website rating for "Ridley Scott"
--demo 6  = putStrLn titles of films rated by "Emma" (with likes/dislikes)
--demo 7  = putStrLn all films after "Emma" says she likes "Avatar"
--demo 71 = putStrLn all films after "Emma" says she likes "Titanic"
--demo 72 = putStrLn all films after "Emma" says she dislikes "Jaws"
--demo 8  = films between 2000 and 2006 inclusive sorted by website rating

--
--
-- Your user interface code goes here
--
--

-- Demonstration Database
testDatabase :: Database
testDatabase = [("Blade Runner", "Ridley Scott", 1982, ["Zoe", "Heidi", "Jo", "Kate", "Emma", "Liz", "Dave", "Sam", "Olga", "Tim"]),
    ("The Fly", "David Cronenberg", 1986, ["Garry", "Dave", "Zoe", "Kevin", "Emma", "Heidi", "Jo", "Kate"]),
    ("Body Of Lies", "Ridley Scott", 2008, ["Garry", "Dave", "Bill", "Olga", "Tim", "Zoe", "Paula"]),
    ("Avatar", "James Cameron", 2009, ["Dave", "Amy", "Liz", "Olga", "Tim", "Zoe", "Paula"]),
    ("Titanic", "James Cameron", 1997, ["Zoe", "Emma", "Paula", "Liz", "Olga", "Dave", "Sam", "Wally", "Kate"]),
    ("The Departed", "Martin Scorsese", 2006, ["Wally", "Liz", "Kevin", "Tim", "Emma", "Olga", "Dave", "Kate", "Zoe"]),
    ("Aliens", "Ridley Scott", 1986, ["Dave", "Garry", "Liz", "Sam", "Wally", "Kate", "Zoe", "Tim", "Emma", "Jo", "Olga"]),
    ("Kingdom Of Heaven", "Ridley Scott", 2005, ["Jo", "Wally", "Emma", "Tim", "Garry", "Ian", "Neal"]),
    ("Alien: Covenant", "Ridley Scott", 2017, ["Kevin", "Tim", "Emma", "Jo", "Liz"]),
    ("E.T. The Extra-Terrestrial", "Steven Spielberg", 1982, ["Dave", "Amy", "Garry", "Ian", "Neal", "Jenny", "Kate", "Emma", "Olga"]),
    ("Bridge of Spies", "Steven Spielberg", 2015, ["Wally", "Sam", "Dave", "Neal", "Bill", "Garry", "Ian", "Kate"]),
    ("Jaws", "Steven Spielberg", 1975, ["Jenny", "Emma", "Bill", "Neal", "Sam", "Ian", "Kate"]),
    ("The Martian", "Ridley Scott", 2015, ["Wally", "Sam", "Dave", "Jo", "Jenny", "Kate", "Emma", "Olga", "Ian", "Neal", "Tim", "Liz"]),
    ("The BFG", "Steven Spielberg", 2016, ["Sam", "Wally", "Dave", "Jo", "Kate", "Neal"]),
    ("The Shawshank Redemption", "Frank Darabont", 1994, ["Dave", "Amy", "Bill", "Garry", "Ian", "Neal", "Kate", "Jenny", "Zoe", "Heidi", "Jo"]),
    ("Gladiator", "Ridley Scott", 2000, ["Olga", "Neal", "Kate", "Garry", "Heidi", "Bill", "Sam", "Zoe"]),
    ("The Green Mile", "Frank Darabont", 1999, ["Kevin", "Tim", "Emma", "Heidi", "Kate", "Jenny", "Zoe"]),
    ("True Lies", "James Cameron", 1994, ["Sam", "Dave", "Emma", "Olga", "Jenny", "Zoe"]),
    ("Super 8", "J J Abrams", 2011, ["Kevin", "Tim", "Emma", "Olga", "Heidi", "Wally", "Dave", "Jenny", "Zoe"]),
    ("Minority Report", "Steven Spielberg", 2002, ["Kevin", "Kate", "Tim", "Emma", "Jenny", "Zoe", "Olga", "Heidi"]),
    ("War Horse", "Steven Spielberg", 2011, ["Garry", "Bill", "Olga", "Jo", "Wally", "Emma", "Tim", "Kate", "Zoe", "Heidi", "Jenny", "Sam"]),
    ("Silence", "Martin Scorsese", 2016, ["Wally", "Emma", "Tim", "Heidi", "Bill", "Jo", "Dave", "Olga"]),
    ("The Terminal", "Steven Spielberg", 2004, ["Kate", "Dave", "Jo", "Wally", "Emma", "Heidi"]),
    ("Star Wars: The Force Awakens", "J J Abrams", 2015, ["Emma", "Wally", "Zoe", "Kate", "Bill", "Dave", "Liz", "Olga", "Jo", "Neal"]),
    ("Hugo", "Martin Scorsese", 2011, ["Wally", "Sam", "Kate", "Bill", "Dave"])]