INCLUDE_DIRECTORIES(${GNUGo_SOURCE_DIR}/patterns)
INCLUDE_DIRECTORIES(${GNUGo_SOURCE_DIR}/engine)
INCLUDE_DIRECTORIES(${GNUGo_SOURCE_DIR}/sgf)
INCLUDE_DIRECTORIES(${GNUGo_SOURCE_DIR}/utils)

########### patterns library ###############

SET(patterns_STAT_SRCS
    aa_attackpat.c
    apatterns.c
    barriers.c
    conn.c
    connections.c
    dfa.c
    dpatterns.c
    eyes.c
    fuseki9.c
    fuseki13.c
    fuseki19.c
    fusekipat.c
    handipat.c
    helpers.c
    influence.c
    josekidb.c
    mcpat.c
    owl_attackpat.c
    owl_defendpat.c
    owl_vital_apat.c
    endgame.c
    patterns.c
    transform.c
    )

ADD_LIBRARY(patterns STATIC ${patterns_STAT_SRCS})
