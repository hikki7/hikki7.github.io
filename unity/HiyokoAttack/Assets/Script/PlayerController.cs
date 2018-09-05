using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

	public float speed = 8f;
	public float moveableRange=5.5f;
	public float power = 1000f;
	public GameObject cannonBall;
	public Transform spawnPoint;

	// Update is called once per frame
	void Update () {
		transform.Translate (Input.GetAxisRaw ("Horizontal") * speed * Time.deltaTime, 0, 0);
		//範囲を-moveableRangeからmoveableRangeにする
		transform.position = new Vector2 (Mathf.Clamp (transform.position.x, -moveableRange, moveableRange), transform.position.y);

		if (Input.GetKeyDown (KeyCode.Space)) {
			Shoot ();
		}
	}

	void Shoot(){
		//Instantiateした後にas GameObjectを入れることでそれを操作することができる
		GameObject newBullet = Instantiate (cannonBall, spawnPoint.position, Quaternion.identity)as GameObject;
		//さっきas GameObjectしたので上に力が入る
		newBullet.GetComponent<Rigidbody2D> ().AddForce (Vector3.up * power);
	}

}
