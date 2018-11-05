PRODUCT_PACKAGES_DEBUG += \
    audio_system_setparameters \
    open_avb_shm_test \
    avb_alsa_test \
    avb_common_test \
    avb_configuration_test \
    avb_control_test \
    avb_control_test_static \
    avb_stream_handler_test \
    audio_IasAudioStream_test \
    audio_alsahandler_unit_test \
    audio_buffertask_test \
    audio_filter_test \
    audio_filterx_test \
    audio_model_test \
    audio_pipeline_test \
    audio_plugin_use_cases_test \
    audio_plugins_unit_test \
    audio_ramp_test \
    audio_routingzone_test \
    audio_rtprocessingfwIntegration_test \
    audio_smartx_dummyConnections_test \
    audio_smartxapi_test \
    audio_switchmatrix_test \
    audio_switchmatrixjob_test \
    audio_testVolumeLoudnessCore_test \
    audio_testVolumeLoudnessSDV_test \
    audio_volumeTest_test \
    audio_year_2038_test

PRODUCT_PACKAGES += \
    daemon_cl \
    libias-media_transport-avb_streamhandler \
    avb_streamhandler_app \
    avb_streamhandler_client_app \
    pluginias-media_transport-avb_configuration_gp_mrb \
    libias-audio-smartx \
    libias-audio-modules \
    libsmartx-subsystem \
    libavbcontrol-subsystem \
    alsa_aplay \
    alsa_arecord \
    alsa_ctl \
    alsa_amixer \
    alsa_loop \
    asound.conf \
    eth_check

AUDIOSERVER_MULTILIB := 64

# for AVB and GPTP services
PRODUCT_PROPERTY_OVERRIDES += persist.vendor.eavb.mode=m

# for gPTP service in automotive profile or not
PRODUCT_PROPERTY_OVERRIDES += persist.vendor.gptp.automotive_profile={{automotive_profile}}

# for AVB service in D6 mode or not
PRODUCT_PROPERTY_OVERRIDES += persist.vendor.d6.mode=n

# SmartX module Properties
smxelements := CFG SMX EVT RZN AHD MDL SXC SHM SMW RB DP DBG TST SMJ

PRODUCT_PROPERTY_OVERRIDES += \
    $(foreach item, $(smxelements), persist.vendor.smartx.$(item)log=3)

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.audioConf=AudioParameterFramework-tdf8532-eavb-master.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.avb.target.name=GrMrb \
    persist.vendor.avb.profile.name=MRB_Master_Audio \
    persist.vendor.avb.audio.rx.srclass=low \
    persist.vendor.avb.video.rx.srclass=low \
    persist.vendor.avb.ifname=eth0 \
    persist.vendor.avb.pcibus=2 \
    persist.vendor.avb.ptp.pdelaycount=0 \
    persist.vendor.avb.ptp.synccount=0 \
    persist.vendor.avb.ptp.loopcount=0 \
    persist.vendor.avb.tx.window.width=6000000 \
    persist.vendor.avb.tx.window.pitch=4000000 \
    persist.vendor.avb.lalsa.baseperiod=384 \
    persist.vendor.avb.lalsa.ringbuffer=12288 \
    persist.vendor.avb.ptime.offset.low=2100000 \
    persist.vendor.avb.ptime.offset.high=2100000 \
    persist.vendor.avb.audio.tstamp.buffer=1 \
    persist.vendor.avb.compatibility.audio="" \
    persist.vendor.avb.alsa.groupname=audio \
    persist.vendor.avb.alsa.smartx.switch=0 \
    persist.vendor.avb.igb.to.cnt=5 \
    persist.vendor.avb.android.boottime=0 \
    persist.vendor.avb.clock.raw=n

# AVB Properties
avbelements := _AMN _ASH _ENV _DMY _RXE _TXE _TX1 _TX2 _AAS _ACS _AVS _LAB _LVB _AJI _AEN _PTP _SCD _HCD _RCD _PCD _MCD _ACC _COC _AUI _SHM

PRODUCT_PROPERTY_OVERRIDES += \
    $(foreach item,$(avbelements),persist.vendor.avb.debug.loglevel.$(item)=4)

PRODUCT_PROPERTY_OVERRIDES += \
    init.svc.vendor.earlyavbaudio=uninitialized
