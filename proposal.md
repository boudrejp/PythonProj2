# Proposal for Group 2, Monday 4PM Summer 2018
Project team: Zeliang (Douglas) Xu, Katie Mo, John Boudreaux

Our analysis will broadly answer the question: *__How were the candidates in the 2016 US presidential election portrayed by hip hop artists?__*

## __Data__

We found a data set from fivethirtyeight.com that provided for the number of times that the candidates for the 2016 US presidential campaign were mentioned in hip hop songs. This is in `data/HipHopLyrics.csv`. The data has 378 entries and the following columns (more information in the 'data' directory of this repository):
* __candidate__: the candidate referenced
  * Uses: used for just about everything... allows for segmenting the different candidates for every type of question we answer
* __song__: song name
  * Uses: useful as an index, but not actively used in analysis
* __sentiment__: positive, negative, or neutral (based on analysis by fivethirtyeight)
  * Uses: reflecting the popularity of the candidate, how they are portrayed by the artists
* __album_release_date__: year of album release
  * Uses: allows for some analysis of candidates being relevant for hip hop before their presidential run
* __line__: the specific lyric mentioning the candidate
  * Uses: "spice" for our report, and possibly a word frequency approach for topics + favorability 
* __url__: link to full song lyrics
  * Uses: probably just as a reference, will not be used actively in this analysis

Additionally, we are bringing in data sets for polling numbers for the 2016 presidential election. These are found in the `data/democrats2016.csv` (169 entires) and `data/republicans2016.csv` (171 entries). This will serve as support for our analysis by giving perspective of how long the candidates were in the race, and relatively how popular they are. While more sophisticated time series analysis could be done, that is beyond the scope of this assignment. All analysis will be around aggregations and averages. Both data tables have the following columns:
* __Poll__: the poller
  * Uses: not used
* __Date__: the dates the poll was conducted
  * Uses: useful for knowing when the candidates were in the race
* __Sample__: the sample size (need to double check into this one)
  * Uses: probably not used
* __Candidate Specific Numbers__: the percentage for each individual candidate in that poll
  * Uses: used for averaging to compare to song lyric mentions
* __Spread__: the candidate who is winning in this poll, and by how much
  * Uses: not directly used

## __Analysis__

To answer our broader topic question, several smaller questions will be answered. These might include, but are not limited to:

* What events lead to song lyric mentions?
(image of visual here)
* Do rappers talk about one candidate? Or multiple?
(image of visual here)
* Are candidates talked about before they run for president? Or only because they are in public eye?
(image of visual here)
* How has Trump’s image in rap changed over time with changing roles in public eye?
(image of visual here)
* Do song mentions tend to correlate to how long a candidate was in the race?
(image of visual here)
* Are some politicians viewed more positively/negatively than others?
(image of visual here)

## __Final Report__

Our final report will be structured as a report of around 8-10 pages, with an overall structure of the following:
* Introduction to the data
* Question groupings
  * Individual questions
    * Analysis and embedded figures
  * Conclusions about the question grouping
* Overall Conclusions

The questions will be grouped by topics. The topics will be:
* Evolution of references over time
* Aggregated view of positivity and negativity of candidates
* Perspective of rappers: how many candidates do they rap about, how many songs mentioning candidates do they have, etc...
