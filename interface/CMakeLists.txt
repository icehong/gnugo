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
    jni_and.c
    )

ADD_LIBRARY(gnugo SHARED ${gnugo_SRCS})

FIND_LIBRARY(log-lib log)
TARGET_LINK_LIBRARIES(gnugo sgf engine sgf utils patterns ${PLATFORM_LIBRARIES} ${log-lib})

INSTALL(TARGETS gnugo DESTINATION bin)
