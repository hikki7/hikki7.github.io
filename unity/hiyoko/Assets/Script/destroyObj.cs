using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class destroyObj : MonoBehaviour {

    public float deleteTime = 2.0f;

	// Use this for initialization
	void Start () {
        //deleteTime後にgameObjectを消す
        Destroy(gameObject, deleteTime);
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
