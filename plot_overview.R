library(tidyverse)
bruno_tracks <- read_csv("Bruno_corpus.csv")
michael_tracks <- read_csv("Michael_corpus.csv")

# Voeg groep toe en combineer
tracks <- bind_rows(
  bruno_tracks  %>% mutate(artist_group = "Bruno Mars"),
  michael_tracks %>% mutate(artist_group = "Michael Jackson"))

# Maak nette kolomnamen (makkelijker werken)
tracks <- tracks %>%
  rename(
    track_name = `Track Name`,
    danceability = Danceability,
    energy = Energy,
    valence = Valence,
    tempo = Tempo,
    loudness = Loudness)

# Check
#glimpse(tracks)

overview <- ggplot(tracks, aes(x = danceability, y = energy, color = artist_group)) +
  geom_point(alpha = 0.7, size = 2) +
  facet_wrap(~ artist_group) + labs(title = "Danceability vs Energy",
                                    x = "Danceability",
                                    y = "Energy", color = "Artist") + theme_minimal()
ggsave("overview_plot.png", overview, width = 10, height = 6)

