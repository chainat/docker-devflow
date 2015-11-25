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


        Run as: <?php echo exec('whoami'); ?>
        <?php phpinfo(); ?>
    </div>
    </body>
</html>