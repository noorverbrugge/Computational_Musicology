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

chroma_bruno <- read_csv("chromagram_bruno.csv")

chroma_bruno <- chroma_bruno %>%
  rename(time = TIME)

# Maak long format
chroma_long <- chroma_bruno %>%
  pivot_longer(
    cols = -time,
    names_to = "pitch",
    values_to = "intensity"
  )

# Plot
chroma <- ggplot(chroma_long, aes(x = time, y = pitch, fill = intensity)) +
  geom_tile() +
  scale_fill_viridis_c() +
  labs(
    title = "Chromagram – Bruno Mars",
    x = "Time (seconds)",
    y = "Pitch Class"
  ) +
  theme_minimal()
ggsave("chromagram_bruno.png", chroma, width = 10, height = 6)
