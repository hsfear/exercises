package controllers

import javax.inject.Inject

import play.api.i18n.Lang
import play.api.mvc.{ Action, Controller }
import services.VocabularyService

class Quiz @Inject() (vocabulary: VocabularyService) extends Controller {
  def quiz(sourceLanguage: Lang, targetLanguage: Lang) = Action {
    vocabulary.findRandomVocabulary(sourceLanguage, targetLanguage).map { v =>
      Ok(v.word)
    } getOrElse {
      NotFound
    }
  }

  def check(sourceLanguage: Lang, word: String, targetLanguage: Lang, translation: String) = Action {
    if (vocabulary.verify(sourceLanguage, word, targetLanguage, translation))
      Ok
    else
      NotAcceptable
  }
}
