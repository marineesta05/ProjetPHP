<?php

require_once 'Controller/usersController.php';
require_once 'chatBotController.php';
require_once 'chatController.php';


$page = isset($_GET['page']) ? $_GET['page'] : 'inscription';

switch ($page) {
    case 'connexion':
        include_once 'controller/usersController.php';
        $users = new UsersController;
        $users->connexion();
        break;

    case 'inscription':
        $users = new UsersController();
        $users->getFormInscription();
        break;

    case 'inscription_action':
        $users = new UsersController();
        $users->inscription();
        break;

    case 'deconnexion':
        session_destroy();
        header("Location: index.php?page=connexion");
        exit();

    case 'ChatBot':
        $chatbotController = new ChatBotController();
        $chatbotController->index();
        break;
        

    case 'chat':
        $chatbot_id = $_GET['chatbot_id'];
        $controller = new ChatController();
        $controller->chat($chatbot_id);
        break;

    default:
        include 'View/404.php';
        break;
}
