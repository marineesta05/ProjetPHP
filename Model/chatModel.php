<?php
include_once 'bdd.php';
class ChatModel {
    private $bdd;

    public function __construct()
    {
        $this->bdd = Bdd::connexion();
    }

    public function getChatbotById($chatbot_id) {
        $stmt = $this->bdd->prepare('SELECT * FROM chatbot WHERE id = ?');
        $stmt->execute([$chatbot_id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    
    public function getAllChatbots() {
        $stmt = $this->bdd->query("SELECT * FROM chatbot");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    
    public function getBlague($chatbot_id) {
        $stmt = $this->bdd->prepare('SELECT texte FROM blagues WHERE chatbot_id = ? ORDER BY RAND() LIMIT 1');
        $stmt->execute([$chatbot_id]);
        return $stmt->fetchColumn();
    }
    
    public function getReponseCulturelle($chatbot_id) {
        $stmt = $this->bdd->prepare('SELECT texte FROM reponses_culturelles WHERE chatbot_id = ? ORDER BY RAND() LIMIT 1');
        $stmt->execute([$chatbot_id]);
        return $stmt->fetchColumn();
    }
    
    public function getAnecdote($chatbot_id) {
        $stmt = $this->bdd->prepare('SELECT texte FROM anecdotes WHERE chatbot_id = ? ORDER BY RAND() LIMIT 1');
        $stmt->execute([$chatbot_id]);
        return $stmt->fetchColumn();
    }

    private function containsAny($message, $variants) {
        foreach ($variants as $variant) {
            if (strpos($message, $variant) !== false) {
                return true;
            }
        }
        return false;
    }
    

    public function getResponse($message_utilisateur, $chatbot_id, $caractere) {
        $message_utilisateur = strtolower($message_utilisateur);  
        $bonjour = ['bonjour', 'salut', 'hello', 'coucou'];
        $cava = ['comment ca va', 'ca va', 'cava', 'comment ça va', 'ça va'];
        $blague = ['raconte moi une blague', 'blague'];
        $fait = ['dis moi un fait cuturel', 'apprends moi quelque chose', 'raconte moi un fait culturel', 'fait culturel', 'fait'];
        $anecdote = ['raconte moi une anecdote', 'raconte moi une histoire', 'anecdote']; 
    
        if ($this->containsAny($message_utilisateur, $bonjour)) {
            if ($caractere === 'amical') {
                return "Bonjour, ravi de te voir !";
            } elseif ($caractere === 'formel') {
                return "Bonjour. Comment puis-je vous aider ?";
            } elseif ($caractere === 'drole') {
                return "Salut, ça roule ?";
            }
        } elseif ($this->containsAny($message_utilisateur, $cava)) {
            if ($caractere === 'amical') {
                return "Je vais bien, et toi ?";
            } elseif ($caractere === 'formel') {
                return "Je vais bien, merci de demander.";
            } elseif ($caractere === 'drole') {
                return "Je vais comme une horloge mal réglée... toujours en retard !";
            }
        } elseif ($this->containsAny($message_utilisateur, $fait) !== false && $caractere === 'formel') {
            return $this->getReponseCulturelle($chatbot_id);
        } elseif ($this->containsAny($message_utilisateur, $blague) !== false && $caractere === 'drole') {
            return $this->getBlague($chatbot_id);
        } elseif ($this->containsAny($message_utilisateur, $anecdote) !== false && $caractere === 'amical') {
            return $this->getAnecdote($chatbot_id);
        } else {
            return "Je ne comprends pas votre question.";
        }
    }
    


    public function saveChat($nom, $message_utilisateur, $response) {
        $stmt = $this->bdd->prepare('INSERT INTO chats (user_id, message_utilisateur, message_chatbot) 
            VALUES ((SELECT id FROM users WHERE nom = ?), ?, ?)');
        $stmt->execute([$nom, $message_utilisateur, $response]);
    }

    public function getChatHistoryByChatbot($nom, $chatbot_id) {
        $stmt = $this->bdd->prepare('
            SELECT message_utilisateur, message_chatbot 
            FROM chats 
            WHERE user_id = (SELECT id FROM users WHERE nom = ?) AND chatbot_id = ?
        ');
        $stmt->execute([$nom, $chatbot_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public function saveSelectedChatbot($user_id, $chatbot_id) {
        $stmt = $this->bdd->prepare('UPDATE users SET chatbot_id = ? WHERE id = ?');
        $stmt->execute([$chatbot_id, $user_id]);
    }
}
