module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('daisyui')
  ],
  daisyui: {
    themes: ["light", "lemonade", "cupcake"],
    darkTheme: false,
  },
  purge: {
    content: [
      './app/**/*.html.erb',
      './app/helpers/**/*.rb',
      './app/javascript/**/*.js',
      './app/views/**/*.erb',
    ],
    safelist: [
      'bg-sky-100',
      'bg-red-300',
      'bg-yellow-300',
      'bg-orange-300',
      'bg-blue-300',
      'bg-purple-300',
      'bg-green-500',
      'text-xs',
      'badge',
      'badge-outline',
      'toast',
      'toast-end',
      'alert',
      'alert-success',
      'alert-error',
      'alert-info'
    ],
  },
}
