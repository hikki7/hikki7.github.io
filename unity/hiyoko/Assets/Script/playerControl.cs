using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class playerControl : MonoBehaviour {

    //===================playerを動かすための変数
    public float speed = 8f;
    public float moveableRange = 5.5f;

    //===================砲弾の変数
    public float power = 1000f;
    public GameObject cannonBall;
    public Transform spawnPoint;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {

        //===============playerをbottonを押して動かす
        //playerを左右に動かす
        //Time.deltaをかけてるのは人間界の時間にするため
        transform.Translate(Input.GetAxisRaw("Horizontal") * speed * Time.deltaTime, 0, 0);
        //positionの値を-moveableRangeからmoveableRangeの間にする
        transform.position = new Vector2(Mathf.Clamp(transform.position.x, -moveableRange, moveableRange), transform.position.y);

        //================砲弾を撃てるようにする
        if(Input.GetKeyDown(KeyCode.Space)){
            Shoot();
        }

	}

    void Shoot(){
        //===============砲弾の発射
        //newBulletを出力する(cannonBallをspawnPointの場所にQuaternion.identityの角度で
        GameObject newBullet = Instantiate(cannonBall, spawnPoint.position, Quaternion.identity) as GameObject;
        //newBulletのrigidbodyに上の方向にpower分だけ力をかける
        newBullet.GetComponent<Rigidbody2D>().AddForce(Vector3.up * power);
    }
}
