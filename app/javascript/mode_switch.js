const STORAGE_KEY = 'mode'

const applyMode = (mode, inputs) => {
  const root = document.documentElement
  const isDark = mode === 'dark'
  const themeValue = isDark ? 'dark' : 'light'
  root.classList.toggle('dark-mode', isDark)
  root.setAttribute('data-theme', themeValue)
  root.setAttribute('data-coreui-theme', themeValue)
  if (inputs) {
    inputs.forEach((input) => { input.checked = isDark })
  }
  window.localStorage.setItem(STORAGE_KEY, themeValue)
}

const initModeSwitches = () => {
  const inputs = Array.from(document.querySelectorAll('[data-bs-toggle="mode"] .form-check-input'))
  if (inputs.length === 0) return

  const stored = window.localStorage.getItem(STORAGE_KEY)
  const initial = stored === 'dark' ? 'dark' : 'light'
  applyMode(initial, inputs)

  inputs.forEach((input) => {
    if (input.dataset.modeInitialized === 'true') return
    input.dataset.modeInitialized = 'true'
    input.addEventListener('change', () => {
      const next = input.checked ? 'dark' : 'light'
      applyMode(next, inputs)
    })
  })
}

document.addEventListener('turbo:load', initModeSwitches)
document.addEventListener('DOMContentLoaded', initModeSwitches)
