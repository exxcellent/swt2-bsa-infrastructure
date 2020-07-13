if [ -z ${1} ]; then echo 'ERROR: PASS BACKEND_VERSION AS FIRST PARAMETER'; exit 1; fi                                                         
                                                                                                                                               
echo "---- start deployment ----"                                                                                                              
                                                                                                                                               
sudo docker login -u exxkcluster -p iB20IplLppfu nexus.cs.exxcellent.de:8484                                                                   
sudo docker-compose -f docker-compose-tag-based.yml stop backend                                                                               
BACKEND_VERSION=$1                                                                                                                             
echo "deploy new Backend-Version ${BACKEND_VERSION}"                                                                                           
sed -i "/BACKEND_VERSION/c\BACKEND_VERSION=$BACKEND_VERSION" .env                                                                              
sudo docker-compose -f docker-compose-tag-based.yml up --build -d backend 