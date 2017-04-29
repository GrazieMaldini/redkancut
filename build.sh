DEFCONFIG=lineageos_cancro_defconfig
make ARCH=arm CROSS_COMPILE=~/gcc/bin/arm-linux-androideabi- $DEFCONFIG
make -j32 ARCH=arm CROSS_COMPILE=~/gcc/bin/arm-linux-androideabi-
rm ~/redkancut/modules/*
for i in `find -name *.ko`; do cp $i ~/redkancut/modules/; done
scripts/dtbToolCM -s 2048 -d "qcom,msm-id = <" -2 -o arch/arm/boot/dt.img -p /usr/bin/ arch/arm/boot/
cp arch/arm/boot/zImage ~/redkancut/
cp arch/arm/boot/dt.img ~/redkancut/
cd ~/redkancut
rm *.zip
zip -r9 redkancut_cancro.zip * -x README redkancut_cancro.zip
cp *.zip /media/sf_ubuntu/release/
