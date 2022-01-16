/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\
 * This is GNU Go, a Go program. Contact gnugo@gnu.org, or see       *
 * http://www.gnu.org/software/gnugo/ for more information.          *
 *                                                                   *
 * Copyright 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007,   *
 * 2008, 2009, 2010 and 2011 by the Free Software Foundation.        *
 *                                                                   *
 * This program is free software; you can redistribute it and/or     *
 * modify it under the terms of the GNU General Public License as    *
 * published by the Free Software Foundation - version 3 or          *
 * (at your option) any later version.                               *
 *                                                                   *
 * This program is distributed in the hope that it will be useful,   *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of    *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the     *
 * GNU General Public License in file COPYING for more details.      *
 *                                                                   *
 * You should have received a copy of the GNU General Public         *
 * License along with this program; if not, write to the Free        *
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor,       *
 * Boston, MA 02111, USA.                                            *
\* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#include "gnugo.h"

#include <stdio.h>
#include <assert.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

#include "interface.h"
#include "liberty.h"
#include "gtp.h"
#include "gg_utils.h"
#include <jni.h>
#include <android/log.h>
#include <stdlib.h>

#define  LOG_TAG    "jni"
#define  LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG,LOG_TAG,__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)

JNIEXPORT jstring JNICALL
Java_com_icehong_gnugo_GnugoService_stringFromJNI(JNIEnv *env, jobject thiz) {
    (*env)->NewStringUTF(env, "Hello from C");
}
JNIEXPORT jintArray JNICALL
Java_com_icehong_gnugo_GnugoService_javaIntArray(JNIEnv *env, jobject thiz, jint len) {
    //第一个参数
    //第二个参数 创建数组的长度
    jintArray jntarray = (*env)->NewIntArray(env, len);

    //数组转化为 jint* 类型
    jint * jintp = (*env)->GetIntArrayElements(env, jntarray, NULL);


    for (int i = 0; i < len; i++)
    {   //jint 本质long 所以可以赋值
        jintp[i] = i * 10;
    }

    //释放同步
    (*env)->ReleaseIntArrayElements(env, jntarray, jintp, 0);
    //返回
    return jntarray;

}
extern int main(int argc, char *argv[]);
JNIEXPORT jint JNICALL
Java_com_icehong_gnugo_GnugoService_main(JNIEnv *env, jobject thiz, jobjectArray para) {
    const char *argv[10] = {0};
    int num = (*env)->GetArrayLength(env, para);
    if (num >= 10) return -1;
    argv[0] = "gnugo" ;
    for (jint i = 0; i < num ; i++) {
        jstring value = (*env)->GetObjectArrayElement(env, para, i);
        argv[i+1] = (*env)->GetStringUTFChars(env,value,NULL);
        LOGD("para %d is: %s", i, argv[i+1]);
    }
    main(num+1, (char **) argv);
    LOGD("start main %d", num+1);
    return 0;
}

JNIEXPORT jint JNICALL
Java_com_icehong_gnugo_GnugoService_gnugoclose(JNIEnv *env, jobject thiz) {
    LOGD("GnugoService exit!!!");
    exit(0);
}

extern int current_id;
JNIEXPORT jstring JNICALL
Java_com_icehong_gnugo_GnugoService_processGTP(JNIEnv *env, jobject thiz, jstring cmd) {
  //TODO to be fixed
  const char *input = (*env)->GetStringUTFChars(env, cmd, NULL);
//  {
//    char line[GTP_BUFSIZE];
//    char command[GTP_BUFSIZE];
//    char *p;
//    int i;
//    int n;
//    int status = GTP_OK;
//
//    strncpy(line, input, GTP_BUFSIZE);
//    line[GTP_BUFSIZE - 1] = 0;
//
//    /* Preprocess the line. */
//    for (i = 0, p = line; line[i]; i++) {
//      char c = line[i];
//      /* Convert HT (9) to SPACE (32). */
//      if (c == 9)
//        *p++ = 32;
//        /* Remove CR (13) and all other control characters except LF (10). */
//      else if ((c > 0 && c <= 9)
//               || (c >= 11 && c <= 31)
//               || c == 127)
//        continue;
//        /* Remove comments. */
//      else if (c == '#')
//        break;
//        /* Keep ordinary text. */
//      else
//        *p++ = c;
//    }
//    /* Terminate string. */
//    *p = 0;
//
//    p = line;
//
//    /* Look for an identification number. */
//    if (sscanf(p, "%d%n", &current_id, &n) == 1)
//      p += n;
//    else
//      current_id = -1; /* No identification number. */
//
//    /* Look for command name. */
//    if (sscanf(p, " %s %n", command, &n) < 1)
//      goto exit;
//    p += n;
//
//    /* Search the list of commands and call the corresponding function
//     * if it's found.
//     */
//    for (i = 0; commands[i].name != NULL; i++) {
//      if (strcmp(command, commands[i].name) == 0) {
//        status = (*commands[i].function)(p);
//        break;
//      }
//    }
//    if (commands[i].name == NULL)
//      gtp_failure("unknown command");
//
//    exit:
//    if (status == GTP_FATAL)
//      gtp_panic();
//  }

}