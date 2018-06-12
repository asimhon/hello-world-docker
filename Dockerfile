# Get image
FROM richarvey/nginx-php-fpm:latest

# Add index
ADD files/index.php /var/www/html/index.php

EXPOSE 80

# Run nginx when the container launches
#CMD ["nginx", "-g", "daemon off;"]
CMD ["/start.sh"]
