###*
 * Image Tag
 * Depends on 'tags/htmltag', 'cloudinary'
###
import HtmlTag from './htmltag'
import url from '../url'

export default class ImageTag extends HtmlTag

  ###*
   * Creates an HTML (DOM) Image tag using Cloudinary as the source.
   * @constructor ImageTag
   * @extends HtmlTag
   * @param {string} [publicId]
   * @param {Object} [options]
  ###
  constructor: (publicId, options = {})->
    super("img", publicId, options)

  ###* @override ###
  closeTag: ()->
    ""

  ###* @override ###
  attributes: ()->
    attr = super() || []
    options = @getOptions()
    srcAttribute = if options.responsive and !options.client_hints then 'data-src' else 'src'
    attr[srcAttribute] ?= url(@publicId, @getOptions())
    attr
