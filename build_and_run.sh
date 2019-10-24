# Build the app locally
echo 'Building the app locally'
cd hello-app
./mvnw -Dmaven.test.skip=true clean package
cd ..

# Build the Docker image with JDK 11 minimal
echo '\nBuilding the image'
docker build -t wesleyegberto/hello-app:minimal .

echo '\nRunning the image'
docker run -it --rm -p 8080:8080 wesleyegberto/hello-app:minimal