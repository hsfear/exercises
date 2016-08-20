package controllers

import javax.inject.Inject

import actors.QuizActor
import play.api.i18n.Lang
import play.api.mvc.{ Action, Controller, Result, WebSocket }
import services.VocabularyService
import play.api.Play.current

class Quiz @Inject() (vocabulary: VocabularyService) extends Controller {
  def quiz(sourceLanguage: Lang, targetLanguage: Lang) = Action {
    vocabulary.findRandomVocabulary(sourceLanguage, targetLanguage) match {
      case Some(v) => Ok(v.word)
      case None => NotFound
    }
  }

  def check(sourceLanguage: Lang, word: String, targetLanguage: Lang, translation: String) = Action { request =>
    val correctScore = request.session.get("correct").map(_.toInt).getOrElse(0)
    val wrongScore = request.session.get("wrong").map(_.toInt).getOrElse(0)
    vocabulary.verify(sourceLanguage, word, targetLanguage, translation) match {
      case true => Ok.withSession("correct" -> (correctScore + 1).toString, "wrong" -> wrongScore.toString)
      case false => NotAcceptable.withSession("correct" -> correctScore.toString, "wrong" -> (wrongScore + 1).toString)
    }
  }

  def quizEndpoint(sourceLang: Lang, targetLang: Lang) = WebSocket.acceptWithActor[String, String] { request =>
    out => QuizActor.props(out, sourceLang, targetLang, vocabulary)
  }

}
