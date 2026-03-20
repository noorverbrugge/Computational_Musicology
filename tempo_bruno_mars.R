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

bruno_tracks_only <- tracks %>%
  filter(artist_group == "Bruno Mars")

tempo <- ggplot(bruno_tracks_only, aes(x = reorder(track_name, tempo), y = tempo)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Tempo of Bruno Mars Tracks",
    x = "Track",
    y = "Tempo (BPM)"
  ) +
  theme_minimal()

ggsave("tempo_bruno.png", tempo, width = 10, height = 6)
