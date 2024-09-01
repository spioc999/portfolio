{{flutter_js}}
{{flutter_build_config}}

// Manipulate the DOM to add a themed loader:
// <div class="loading">
//   <div class="loader" />
// </div>

function getIsDarkMode() {
  const _dark = "dark";

  const modeFromStorage = window.localStorage.getItem("flutter.themeMode");
  let mode;
  if(modeFromStorage){
    mode = JSON.parse(modeFromStorage);
  } else{
    mode = _dark;
  }

  return mode == _dark;
}

const isDarkMode = getIsDarkMode();

document.body.style.backgroundColor = isDarkMode ? "#131317" : "#FFF";

const loadingDiv = document.createElement('div');
loadingDiv.className = "loading";
document.body.appendChild(loadingDiv);

const loaderDiv = document.createElement('div');
loaderDiv.className = isDarkMode ? "light-loader" : "dark-loader";
loadingDiv.appendChild(loaderDiv);

// Customize the app initialization process
_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();

    // Remove the loading div when the app runner is ready
    if (document.body.contains(loadingDiv)) {
      document.body.removeChild(loadingDiv);
    }
    await appRunner.runApp();
  }
});