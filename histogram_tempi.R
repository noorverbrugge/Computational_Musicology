library(tidyverse)
bruno_tracks <- read_csv("Bruno_corpus.csv")
michael_tracks <- read_csv("Michael_corpus.csv")

tracks <- bind_rows(
  bruno_tracks  %>% mutate(artist_group = "Bruno Mars"),
  michael_tracks %>% mutate(artist_group = "Michael Jackson"))

tracks <- tracks %>%
  rename(
    track_name = `Track Name`,
    danceability = Danceability,
    energy = Energy,
    valence = Valence,
    tempo = Tempo,
    loudness = Loudness)

histogram <- ggplot(tracks, aes(x = tempo, fill = artist_group)) +
  geom_histogram(binwidth = 5, alpha = 0.7, position = "identity") +
  labs(
    title = "Tempo Distribution of Bruno Mars and Michael Jackson Songs",
    x = "Tempo (BPM)",
    y = "Number of Tracks",
    fill = "Artist Group"
  ) +
  theme_minimal()

histogram
