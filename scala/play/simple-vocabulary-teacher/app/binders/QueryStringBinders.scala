package binders

import play.api.i18n.Lang
import play.api.mvc.QueryStringBindable

object QueryStringBinders {
  implicit object LangQueryBindable extends QueryStringBindable[Lang] {

    override def bind(key: String, params: Map[String, Seq[String]]): Option[Either[String, Lang]] =
      params.get(key).flatMap(_.headOption).map { value =>
        Lang.get(value).toRight(s"Language $value is not recognized")
      }

    override def unbind(key: String, value: Lang): String = value.code
  }

}
