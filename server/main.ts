import { join } from 'node:path'
import { BrowserWindow, app, globalShortcut } from 'electron'
import * as url from 'url'
import * as path from 'path'
// import { connectServer } from './src/websocket'


function createWindow() {
  const win = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      preload: join(__dirname, 'src/app/preload.js')
    }
  })

  globalShortcut.register('CommandOrControl+Shift+K', () => {
    win.webContents.openDevTools()
  })

  window.addEventListener('beforeunload', () => {
    globalShortcut.unregisterAll()
  })

  win.loadURL(url.format({
    pathname: path.join(__dirname, 'src/app/index.html'),
    protocol: 'file:',
    slashes: true
  }));

  // win.loadFile(join(__dirname,'src/app/index.html'))
}

app.whenReady().then(() => {
  createWindow()
  // connectServer();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow()
    }
  })
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})