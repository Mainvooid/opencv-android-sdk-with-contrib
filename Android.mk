LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)
OPENCV_LIB_TYPE :=STATIC

ifeq ("$(wildcard $(OPENCV_MK_PATH))","")
include $(LOCAL_PATH)/native/jni/OpenCV.mk
else
include $(OPENCV_MK_PATH)
endif

LOCAL_MODULE := opencv3
LOCAL_LDLIBS += -llog -ljnigraphics
LOCAL_SRC_FILES := opencv3.cpp
include $(BUILD_SHARED_LIBRARY)

#LOCAL_SRC_FILES := opencv3.so
#include $(PREBUILT_SHARED_LIBRARY)
