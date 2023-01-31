using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Title : MonoBehaviour
{
    //[SerializeField, Header("StartButtom‚ð“ü‚ê‚Ä‚Ë")]
    //private GameObject startUI;

    //[SerializeField, Header("QuietButtom‚ð“ü‚ê‚Ä‚Ë")]
    //private GameObject quietUI;

    public void OnClickStartButton()
    {
        SceneManager.LoadScene("Main");
    }

    public void OnClickEndButton()
    {
        Application.Quit();
    }
    public void OnClickTitleButton()
    {
        StageCtl.stageIndex = 0;
        SceneManager.LoadScene("Title");
    }
    public void SceneReload()
    {
        SceneManager.LoadScene("Main");
        StageCtl.stageIndex++;
        Debug.Log(StageCtl.stageIndex);
    }
    
}
