LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),p1m)
include $(call all-makefiles-under,$(LOCAL_PATH))

endif
