def handle_js_confirm
  page.evaluate_script 'window.confirmMsg = null'
  page.evaluate_script 'window.confirm = function(msg) { window.confirmMsg = msg; return true; }'
  yield
  page.evaluate_script 'window.confirmMsg'
end