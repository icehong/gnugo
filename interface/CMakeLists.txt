INCLUDE_DIRECTORIES(${GNUGo_SOURCE_DIR}/engine)
INCLUDE_DIRECTORIES(${GNUGo_SOURCE_DIR}/sgf)
INCLUDE_DIRECTORIES(${GNUGo_SOURCE_DIR}/utils)

########### gnugo executable ###############

SET(gnugo_SRCS
    main.c
    play_ascii.c
    play_gmp.c
    play_gtp.c
    play_solo.c
    play_test.c
    gmp.c
    gtp.c
    )

ADD_EXECUTABLE(gnugo ${gnugo_SRCS})

TARGET_LINK_LIBRARIES(gnugo sgf engine sgf utils patterns ${PLATFORM_LIBRARIES})

INSTALL(TARGETS gnugo DESTINATION bin)
