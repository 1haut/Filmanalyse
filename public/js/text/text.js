export const text = [
  {
    headline: "Basic",
    comments: [
      "Key insights: Given the number of films, there seems to be low budget movies.",
      "Key insights: No genre averages over 6.7 or lower than 5.2 (meaning generally low variance), there are preferences (Documentary, Music, Animation) and disinclinations (chiefly Horror).",
      "Key insights: Strong growth after the year 2000, with an average of around 10% growth YOY until 2020 (pandemic year). Given the size of the dataset (500K+ movies), can signify rise inindependant/low-budget filmmaking.",
    ],
    titles: [
      "Most prolific filmmakers of all time",
      "Average rating by genre",
      "Movies made per year",
    ],
    paths: [],
  },
  {
    headline: "Genres",
    comments: [
      "Key insights: Over half of all movies (featured in dataset) have only one genre. ~2.5% of all movies have 5 or more genres",
      "Key insight: ~40% of movies with a solo genre are documentaries.",
      "Key insights: Documentaries are not likely to be combined with other genres as seen in other genres, unlike romance, drama, comedy.",
    ],
    titles: [
      "Movies by number of genres",
      "Number of movies per genre (Solo genre movies only)",
      "Most common movie combinations",
    ],
  },
  {
    headline: "Box office",
    comments: [
      "Key insights: Animation, adventure and family movies highest return on interest. History, Western and Documentary lowest average ROI.",
      "Key insight: Budget rises consistently year over year until year 2000. Revenue more volatile (could by affected by outliers) but raises over time on average until year 2020.",
    ],
    titles: [
      "Average budget by genre (in USD)",
      "Average return on interest by genre",
    ],
  },
  {
    headline: "Miscellaneous",
    comments: [
      "Key insights: Runtime of average movies steady increase until year 1960. Flat average runtimes after.",
    ],
    titles: ["Feature movie average runtime (mins)"],
  },
  {
    headline: "Trends",
    comments: [
      "Key insights: Strong correlation between TMDB movie rating and box office revenue, suggesting popular movies earn more.",
      "Documentaries are by far the cheapest genre, adventure movies are more expensive",
    ],
    titles: ["Average revenue by movie rating", "Average budget per genre"],
  },
  {
    headline: "Recency",
    comments: ["Key insight: Strong presense of dramas and comedies."],
    titles: ["Most popular recent (2020 and after) non-documentary movies"],
  },
];
