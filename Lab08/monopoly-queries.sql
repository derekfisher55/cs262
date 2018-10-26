-- -- Get the number of Game records.
-- SELECT *
--   FROM Game
--   ;

-- -- Get the player records.
-- SELECT *
--   FROM Player
--   ;

-- -- Get all the users with Calvin email addresses.
-- SELECT *
--   FROM Player
--  WHERE emailAddress LIKE '%calvin%'
--  ;

-- -- Get the highest score ever recorded.
--   SELECT score
--     FROM PlayerGame
-- ORDER BY score DESC
--    LIMIT 1
--    ;

-- -- Get the cross-product of all the tables.
-- SELECT *
--   FROM Player, PlayerGame, Game
--   ;

-- -- Get a list of all the games, ordered by date with the most recent game coming first.
--   SELECT *
--     FROM Game
-- ORDER BY time DESC
-- ;

-- -- Get all the games that occurred in the past week.
-- SELECT *
--   FROM Game
--  WHERE DATE_PART('day', NOW() - time) < 7
--  ;

-- -- Get a list of players who have (non-NULL) names.
-- SELECT *
--   FROM Players
--  WHERE name IS NOT NULL
--  ;

-- -- Get a list of IDs for players who have some game score larger than 2000.
-- SELECT DISTINCT playerID
--   FROM PlayerGame
--  WHERE score > 2000
--  ;

-- -- Get a list of players who have GMail accounts.
-- SELECT *
--   FROM Player
--  WHERE emailAddress LIKE '%gmail%'
--  ;

-- -- Get all “The King”’s game scores in decreasing order.
-- SELECT score
--   FROM PlayerGame INNER JOIN Player ON PlayerGame.playerID = Player.ID
--  WHERE name = 'The King'
--  ;

-- -- Get the name of the winner of the game played on 2006-06-28 13:20:00.
-- SELECT name
--   FROM Player INNER JOIN PlayerGame
--     ON Player.ID = PlayerGame.playerID INNER JOIN Game
--     ON Game.ID = PlayerGame.gameID
--    AND score = (SELECT max(score)
--                   FROM PlayerGame
--                  WHERE gameID =
--                     (SELECT ID
--                        FROM Game
--                       WHERE time = '2006-06-28 13:20:00'))
--                       ;

-- -- What does that P1.ID < P2.ID clause do in the last example query?
-- This clause is checking to see if the IDs are unique.
-- By checking if one id's value is less than the other,
-- you can be sure the ids are not the same.

-- The query that joined the Player table to itself seems rather contrived.
-- Can you think of a realistic situation in which you’d want to join a table to itself?
-- From the example, the author wanted to make a table of all the users who had the
-- same name. This seems like a reasonable use of this feature. Another example
-- would be if you wanted to see all the orders placed by a particular customer.
