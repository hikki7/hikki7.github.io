using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class hiyokoGenerator : MonoBehaviour {

    public GameObject obj;
    public float interval = 3.0f;

	// Use this for initialization
	void Start () {
        //0.1f後にintervalである3秒毎にSpawnObj()を呼び出す
        InvokeRepeating("SpawnObj", 0.1f, interval);
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    void SpawnObj(){
        Instantiate(obj, transform.position, transform.rotation);

    }
}
