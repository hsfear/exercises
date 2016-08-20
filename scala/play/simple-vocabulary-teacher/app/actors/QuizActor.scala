package actors

import akka.actor.{ Actor, ActorRef, Props }
import play.api.i18n.Lang
import services.VocabularyService

class QuizActor(out: ActorRef, sourceLang: Lang, targetLang: Lang, vocabulary: VocabularyService) extends Actor {

  private var word = ""

  override def preStart(): Unit = sendWord()

  def receive = {
    case translation: String if vocabulary.verify(sourceLang, word, targetLang, translation) =>
      out ! "Correct"
      sendWord()
    case _ => out ! "Incorrect, try again!"
  }

  def sendWord() = {
    vocabulary.findRandomVocabulary(sourceLang, targetLang) match {
      case Some(v) =>
        out ! s"Please translate '${v.word}'"
        word = v.word
      case None =>
        out ! s"I don't know any word for ${sourceLang.code} and ${targetLang.code}"
    }
  }

}

object QuizActor {
  def props(out: ActorRef, sourceLang: Lang, targetLang: Lang, vocabulary: VocabularyService): Props =
    Props(classOf[QuizActor], out, sourceLang, targetLang, vocabulary)
}
