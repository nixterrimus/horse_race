## The Story So far

There once was a crooked stable manager, who, for a small fee, would let you run any of the horses at the small, rundown track.  He would gladly let you pick any of the horses from the stable and let them run a race.  The one condition, he snidely insisted while twirling his waxed mustache, is that you weren't allowed your pocket watch.  He insisted that that would be unfair.

This race track had **25 horses**.  They ranged in age and stamina from young, hot-headed speed demons to old shaggy plow horses.  The track was muddy and ill kept with **5 sorry lanes** for the horses to run in.

And so there you were, knowing that this Sunday was the big race.  The big race in which the **top 3** positions would award cash.  You needed the money, you wife, and kids and 13 dogs were all depending on you.  It wouldn't be so bad if you hadn't injured your hand at the shipping yard last week.

This horse track had more quirk worth noting.  If Eddy G beat out Old Lightning one race then Eddy G would always win in any race.  It's as if the horses speed was fixed and immutable.

So the question for you, with your small bag of silver coins, is **How many times do you need to pay the crooked stable manager to absolutely know what the top 3 horses are?**

## Meet the Players

Ah, back to the world of code.  This project sets the stage for solving the horse racing problem presented above.  There are relatively few domain models here, but let me introduce them:

- Racer: A racer is the model that does the racing.  It has a name, which defaults to "Ed", a bib number (you know, those white tags runners pin to their shirts with a number on them), a speed (which is fixed), and a record of how many racers they've run.
- Racers: A collection object which holds racer objects.  It's `enumerable` and adds some helper methods to find `unraced` racers and racers with a specific `race_count`.
- Race: An object that represents an individual race.  It records who entered the race, the results, and has an accessor to quickly get the winner.

In addition to the domain models there's also a class for representing the problem which includes all the variables for `track_size`, `number_of_horses` and the `number_of_winners` we are looking for.  For the command line it comes with an Interactive version which uses highline to ask for user input.

There's also a solution class which is used for computing the solution to the problem.  The `BaseCase` is a poor implementation of the solution.  **The master branch does not have an implementation of the QuickR solution, so if you'd like to solve it, you still have the opportunity** 

## Running the code

To run the code:

- clone the repository
- cd into `horse_race`
- `bundle install`
- run `bin/horse-race`

## Running the tests

The code is pretty well tested, you can run the tests by running `rspec spec/`.

**There is a failing test for an implementation of the QuickR solution, that is expected.  Want to try and solve it?**


## Sample Run

```bash
> bin/horse-race
> bin/horse-race
Welcome to Horse Racing
1: Base Case
2: QuickR
Choose solution strategy  1
How many horses should race?  |25|  25
How spots are there on the track?  |5|  5
How many winners are we looking for? |3| 3

With the Solution::BaseCase Strategy
Solution succeeded? true
25 raced on a 5 laned track
The top 3 horses are:
  - Ed 1
  - Ed 4
  - Ed 10
This was computed in 11 races
```

## How the Base Case 

With a track size of 5 and 3 possible 

```
Race 5 horses, take the top 3
While there are still unraced horses
  Race previous top 3 + 2 more horses
  The top 3 from the last race are the real top 3
```

## Thanks

This problem was put to me by [Marcos Sainz](https://twitter.com/sainzmar), I enjoyed working on it.
