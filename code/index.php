<!DOCTYPE html>
<html>
    <head>
        <title>DevFlow</title>
        <style>
            .wrapper{
                width:1024px;
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
    <div class="wrapper">
        <h1><?php echo "DOCKER DEVELOPMENT WORKFLOW"; ?></h1>
        Time: <?php echo date('d/m/Y H:i:s'); ?>

        <p>DB INFO</p>
        <ul>
            <li>HOST: <?php echo getenv('DB_PORT_3306_TCP_ADDR'); ?></li>
            <li>PORT: <?php echo getenv('DB_PORT_3306_TCP_PORT'); ?></li>
            <li>ROOT: <?php echo getenv('DB_ENV_MYSQL_ROOT_PASSWORD'); ?></li>
            <li>PWD: <?php echo getenv('DB_ENV_MYSQL_ROOT_USER'); ?></li>
            <li>DB: <?php echo getenv('DB_ENV_MYSQL_DATABASE'); ?></li>
        </ul>


        <?php
            $host=getenv('DB_PORT_3306_TCP_ADDR');
            $username=getenv('DB_ENV_MYSQL_ROOT_PASSWORD');
            $password=getenv('DB_ENV_MYSQL_ROOT_USER');
            $db=getenv('DB_ENV_MYSQL_DATABASE');

            // Create connection
            $can_connect = true;
            try {
                $conn = new mysqli($host, $username, $password);
            }catch (mysqli_sql_exception $e){
                $can_connect = false;
            }

            echo 'DB Connection Status: ' . ($can_connect?'Connected':'Failed');
        ?>

        <p>
            Run as: <?php echo exec('whoami'); ?>
        </p>

        <div style="clear:both; height:600px; overflow:scroll;">
            <?php phpinfo(); ?>
        </div>
    </div>
    </body>
</html>