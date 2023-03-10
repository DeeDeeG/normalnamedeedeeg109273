Normalnamedeedeeg109273 = require '../lib/normalnamedeedeeg109273'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Normalnamedeedeeg109273", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('normalnamedeedeeg109273')

  describe "when the normalnamedeedeeg109273:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
      # Before the activation event the view is not on the DOM, and no panel
      # has been created
      expect(workspaceElement.querySelector('.normalnamedeedeeg109273')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'normalnamedeedeeg109273:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.normalnamedeedeeg109273')).toExist()

        normalnamedeedeeg109273Element = workspaceElement.querySelector('.normalnamedeedeeg109273')
        expect(normalnamedeedeeg109273Element).toExist()

        normalnamedeedeeg109273Panel = atom.workspace.panelForItem(normalnamedeedeeg109273Element)
        expect(normalnamedeedeeg109273Panel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'normalnamedeedeeg109273:toggle'
        expect(normalnamedeedeeg109273Panel.isVisible()).toBe false

    it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.normalnamedeedeeg109273')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'normalnamedeedeeg109273:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        # Now we can test for view visibility
        normalnamedeedeeg109273Element = workspaceElement.querySelector('.normalnamedeedeeg109273')
        expect(normalnamedeedeeg109273Element).toBeVisible()
        atom.commands.dispatch workspaceElement, 'normalnamedeedeeg109273:toggle'
        expect(normalnamedeedeeg109273Element).not.toBeVisible()
