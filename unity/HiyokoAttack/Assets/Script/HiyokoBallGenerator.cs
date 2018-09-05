using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HiyokoBallGenerator : MonoBehaviour {

	public GameObject obj;
	[HideInInspector]public float interval = 3.0f;

	// Use this for initialization
	void Start () {
		//InvokeRepeatingは0.1fからinterval毎にSpawn()を呼び出す関数
		InvokeRepeating ("SpawnObj", 0.1f, interval);
	}
	
	void SpawnObj(){
		Instantiate (obj, transform.position, transform.rotation);
	}
}
