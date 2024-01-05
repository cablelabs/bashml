#! /bin/bash
mkdir -p dist
INSTALLER="dist/installer.sh"
cat > ${INSTALLER} <<ANY
#! /bin/bash
mkdir -p bashml
mkdir -p bashml/bin
mkdir -p bashml/scripts
ANY
ENABLE_ALL=${ENABLE_ALL:-"yes"}

COMMON_SCRIPTS="bcg dependencies help diffg"
MLR_SCRIPTS="mlr ols earg dot eliminate identity etranspose invert mult transpose"
DT_SCRIPTS="dt entropy gain maxgain id3"
RF_SCRIPTS="shufg rf rfp rft"
LR_SCRIPTS="lr"
QL_SCRIPTS="ql" 

function add_file {
  script_dir=$1
  script_file=$2
  echo "adding file ${script_dir}/${script_file}"
  echo -e "cat > bashml/${script_dir}/${script_file} << 'HERE'" >> ${INSTALLER}
  cat ${script_dir}/${script_file} >> ${INSTALLER}
  echo -e "HERE" >> ${INSTALLER}
  echo -e "chmod u+x bashml/${script_dir}/${script_file}" >> ${INSTALLER}
}

for f in `ls bin`; do
  add_file bin $f
done
for f in ${COMMON_SCRIPTS}; do
  add_file scripts $f
done

if [ "${ENABLE_ALL}" == "yes" ] || [ "${ENABLE_MLR}" == "yes" ]; then
  for f in ${MLR_SCRIPTS}; do
    add_file scripts $f
  done
fi
if [ "${ENABLE_ALL}" == "yes" ] || [ "${ENABLE_DT}" == "yes" ]; then
  for f in ${DT_SCRIPTS}; do
    add_file scripts $f
  done
fi
if [ "${ENABLE_ALL}" == "yes" ] || [ "${ENABLE_RF}" == "yes" ]; then
  for f in ${RF_SCRIPTS}; do
    add_file scripts $f
  done
fi
if [ "${ENABLE_ALL}" == "yes" ] || [ "${ENABLE_LR}" == "yes" ]; then
  for f in ${LR_SCRIPTS}; do
    add_file scripts $f
  done
fi
if [ "${ENABLE_ALL}" == "yes" ] || [ "${ENABLE_QL}" == "yes" ]; then
  for f in ${QL_SCRIPTS}; do
    add_file scripts $f
  done
fi

echo -e "BASHML_PATH=\$(pwd)/bashml/bin" >> ${INSTALLER}
echo -e "cat > bashml/.env << HERE" >> ${INSTALLER}
echo -e "export PATH=\${BASHML_PATH}:\\\${PATH}" >> ${INSTALLER}
echo -e "HERE" >> ${INSTALLER}
echo -e "echo \"Add bashml to your path with: source bashml/.env\"" >> ${INSTALLER}
chmod u+x ${INSTALLER}
