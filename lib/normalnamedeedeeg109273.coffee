Normalnamedeedeeg109273View = require './normalnamedeedeeg109273-view'
{CompositeDisposable} = require 'atom'

module.exports = Normalnamedeedeeg109273 =
  normalnamedeedeeg109273View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @normalnamedeedeeg109273View = new Normalnamedeedeeg109273View(state.normalnamedeedeeg109273ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @normalnamedeedeeg109273View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'normalnamedeedeeg109273:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @normalnamedeedeeg109273View.destroy()

  serialize: ->
    normalnamedeedeeg109273ViewState: @normalnamedeedeeg109273View.serialize()

  toggle: ->
    console.log 'Normalnamedeedeeg109273 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
