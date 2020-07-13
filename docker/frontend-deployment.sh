if [ -z ${1} ]; then echo 'ERROR: PASS FRONTEND_VERSION AS FIRST PARAMETER'; exit 1; fi                                                        
                                                                                                                                               
echo "---- start deployment ----"                                                                                                              
                                                                                                                                               
sudo docker login -u exxkcluster -p iB20IplLppfu nexus.cs.exxcellent.de:8484                                                                   
sudo docker-compose -f docker-compose-tag-based.yml stop frontend                                                                              
FRONTEND_VERSION=$1                                                                                                                            
echo "deploy new FRONTEND_VERSION ${FRONTEND_VERSION}"                                                                                         
sed -i "/FRONTEND_VERSION/c\FRONTEND_VERSION=$FRONTEND_VERSION" .env                                                                           
sudo docker-compose -f docker-compose-tag-based.yml up --build -d frontend