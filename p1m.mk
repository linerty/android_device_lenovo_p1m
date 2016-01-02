LOCAL_PATH := device/lenovo/p1m

$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/recovery/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/kernel:kernel \
    $(LOCAL_PATH)/recovery/recovery.fstab:recovery/root/etc/recovery.fstab

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := p1m

# recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/file_contexts:root/file_contexts \
	$(LOCAL_PATH)/recovery/libext4_utils.so:root/sbin/libext4_utils.so \
	$(LOCAL_PATH)/recovery/ueventd.rc:root/ueventd.rc

# Set insecure for root access and device specifics
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1
